    function ll = Mgauss_lda_likelihood(D,Mean,Var,alpha,Nos_Samples)
    K=size(alpha,1);
    [nos_genes,nos_cells]=size(D);
    gck(:,:,1)=zeros(nos_genes,nos_cells);
    vsmall=1e-15;
    for k=1:K                        
        for c=1:nos_cells
            gck(:,c,k) = normpdf(D(:,c),Mean(:,k),Var(:,k));           % Q & gck are G x C x K arrays              
        end           
    end
    
   %Computing Likelihood
    lambda = gamrnd(repmat(alpha,1,Nos_Samples),1,K,Nos_Samples)';    %draw from Gamma with params (alpha,1)
    lambda = (lambda./repmat(sum(lambda')',1,K))';                    %K x Nos_Sample
    
    ll = 0;  
    for c=1:nos_cells
        ll_c = 0;
        temp = zeros(nos_genes,Nos_Samples);  
        temp = reshape(gck(:,c,:),nos_genes,K)*lambda;              %\sum_k p(g_c | k)*\lambda_k^n
        temp(find(temp<vsmall))=vsmall;
        temp = log(temp);                                           %log(\sum_k p(g_c | k)*\lambda_k^n)
        s_temp = sum(temp);                                         %\sum_g log(\sum_k p(g_c | k)*\lambda_k^n)
        ll_c = sum(exp(s_temp - max(s_temp)));                      %\sum_n exp(\sum_g log(\sum_k p(g_c | k)*\lambda_k^n))
        ll = ll + log(ll_c)+ max(s_temp) - log(Nos_Samples);        %\sum_c log(1/N \sum_n exp(\sum_g log(\sum_k p(g_c | k)*\lambda_k^n)))
    end
