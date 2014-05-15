%Demo Script for LPD
%Simon Rogers 13/01/2004
%
%Requires following files:
%full_gaussian_lda.m
%bar_plot.m
%update_alpha.m
%ovarian.mat
%
%All are available from http://www.enm.bris.ac.uk/lpd

%clear all;
%Clear workspace


%Load data
disp('Loading Data..');
load ../website/data/ovarian;

%Set lpd parameters
no_l_samples=0;     %Don't calc likelihood
mdisplay=1;         %Display progress
K=2;                %2 latent processes
no_reps=100;        %100 training reps

%start LPD
disp('Starting LPD..');
[Means, Vars, Gamma, Gamma_norm, Alpha, ll, likes]=full_gaussian_lda(data.x,K,no_reps,no_l_samples,mdisplay);

%Calculate final Likelihood
no_l_samples=1000;
disp('Calculating Final Likelihood..');
ll = Mgauss_lda_likelihood(data.x,Means,Vars,Alpha,no_l_samples);
sprintf('Likelihood: %f',ll);

%Plot Process Means
figure(2);
plot(Means(:,1),Means(:,2),'k.');

%Find Interesting Genes
M=(Means(:,1)-Means(:,2))./sqrt(Vars(:,1)+Vars(:,2));
M=abs(M);
c=[[1:1536]' M];
c=sortrows(c,[2 2]);

%Take top 20 say
a=c(end-19:end,:);
q=sprintf('GeneNo\tScore');
disp(q);
for i=1:20
    q=sprintf('%d\t%f',a(i,1),a(i,2));
    disp(q);
end

h=figure(3);
plot(data.x(a(end,1),:));
set(h,'Name',['Gene ' num2str(a(end,1))]);

h=figure(2);
hold on
plot(Means(a(:,1),1),Means(a(:,1),2),'ko','markersize',10);
set(h,'Name','Scatter of Gene Means');

h=figure(1);
set(h,'Name','Variational Gamma Parameters');