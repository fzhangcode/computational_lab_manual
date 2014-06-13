function [Means,Vars,Gamma,Gamma_norm,Alpha,ll,likes]=full_gaussian_lda(Data,K,no_reps,no_l_samples,mdisplay)

%Matlab Implementation of Gaussian LPD
%******************************************
%Method described in:
%The Latent Process Decomposition of cDNA Microarray Datasets
%Simon Rogers, Mark Girolami and Colin Campbell
%Further information available at http://www.enm.bris.ac.uk/lpd

%[Means,Vars,Gamma,Gamma_norm,Alpha,ll]=full_gaussian_lda(Data,K,no_reps,no_l_samples,mdisplay)


%Inputs:
%Data - G x S matrix of real expression values
%K - no. of latent processes
%no_reps - number of training repetitions
%no_l_samples - number of samples from Dirichlet for likelihood estimation
%(set to zero to not calculate)
%mdisplay - 0 for no feedback during training, 1 for iteration number and
%current gamma values

%Outputs:
%Means - G x K matrix of process means
%Vars - G x K matrix of process variances
%Gamma - S x K matrix of variational Dirichlet parameters
%Gamma_norm - S x K matrix of variational Dirichlet expectations
%(equivalent to normalised parameters)
%Alpha - model Dirichlet parameters (K x 1)
%ll - final data likelihood



%Initialise Variables
[no_feat, no_samp]=size(Data);
Means=repmat(mean(Data,2),1,K); %Mean variables - initialised to gene means
Vars=repmat(std(Data')',1,K); %Variance variables - initalised to variances
Gamma=10*rand(no_samp,K); %Gamma variational parameter
Alpha=ones(K,1); %Dirichlet parameters
No_Alpha_Steps=100;
Alpha_Tolerance=1e-10;
pos=find(std(Data')'~=0);
%Find the smallest NON ZERO standard deviation to set as minimum variance.
minimum_variance=min(std(Data(pos,:)')); %Avoid variances falling in on themselves

likes=[];
Vars(find(Vars<minimum_variance))=minimum_variance;

for rep=1:no_reps %Main iteration loop start
    
    %Display iteration number
    if mdisplay==1
        v=sprintf('Repetition Number: %d',rep);
        disp(v);
    end
    
    %Update Q - i.e. P(k|g,c) - i.e. the probability that expression value
    %for gene g in sample c was produced by process k
    %NOTE Q=G x C x K - i.e. genes by processes by samples
    Q=zeros(no_feat,no_samp,K);
    %Calculate sum of Gamma over each process
    sa=sum(Gamma,2);
    for k=1:K
        for s=1:no_samp
            temp=exp(psi(0,Gamma(s,k))-psi(0,sa(s)));
            Q(:,s,k)=temp*normpdf(Data(:,s),Means(:,k),sqrt(Vars(:,k)));
        end
    end
    
    
    %*******************************************************
    %calculate the likelihood
    
    if no_l_samples>0
        ll=Mgauss_lda_likelihood(Data,Means,sqrt(Vars),Alpha,no_l_samples);
        likes=[likes ll];
    end
    %************************************************************
    %Normalise Q
    sumQ=sum(Q,3); %Sum over 3rd dimension
    for k=1:K
        Q(:,:,k)=Q(:,:,k)./sumQ;
    end
    
    %*************************************************************

    %Update Gamma
    Gamma=repmat(Alpha',no_samp,1)+reshape(sum(Q),no_samp,K);
    Gamma_norm=Gamma./repmat(sum(Gamma,2),1,K);
            
    
    %Update parameters
    tempd=sum(Q,2);
    tempd=reshape(tempd,no_feat,K);
    %Mean Update
    for k=1:K
        Means(:,k)=(sum(Q(:,:,k).*Data,2))./tempd(:,k);
    end
    
 
    %Variance Update
    for k=1:K
        Vars(:,k)=(sum(Q(:,:,k).*((Data-repmat(Means(:,k),1,no_samp)).^2),2))./tempd(:,k);
    end
    %Check for variance collapse
    Vars(find(Vars<minimum_variance))=minimum_variance;    
      
    %Update Alpha with the newton_raphson method
    alpha_change=1;
    alpha_old=Alpha;
    j=0;
    while((j <= No_Alpha_Steps) & (alpha_change > Alpha_Tolerance))
        Alpha=update_alpha(Data,Alpha,Gamma');%Note gamma transposed
        alpha_change=norm(Alpha-alpha_old);
        alpha_old=Alpha;
        j=j+1;
    end
    %Display stuff
    if rem(rep,5)==0 & mdisplay==1
        figure(1);
        bar_plot(Gamma_norm');
        pause(0.001);     
    end
    
end
%Normalise Gamma and calc final likelihood
ll=0;
Gamma_norm=Gamma./repmat(sum(Gamma,2),1,K);
if no_l_samples>0
    ll=Mgauss_lda_likelihood(Data,Means,sqrt(Vars),Alpha,no_l_samples);
end
