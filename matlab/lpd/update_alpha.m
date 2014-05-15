function alpha_new = update_alpha(Data,alpha_old,gamma_old);
%Newton Raphson method for updating Alpha
M = size(Data,2);
K = length(alpha_old);

alpha_small=1e-3;
alpha_old(find(alpha_old<0))=alpha_small;

s_alpha = sum(alpha_old);

grad = M * (ones(K,1)*(psi(s_alpha)) - psi(alpha_old)) +...
       sum(psi(gamma_old') - repmat(psi(sum(gamma_old)'),1,K))';
   
Hessian_mat = -M * diag(psi(1,alpha_old)) + M * ones(K)*psi(1,s_alpha);

alpha_new = alpha_old - inv(Hessian_mat)*grad;


