function [xk,xk_prev,k] = relaxationMethod(H_D,g_D,eps)
x_prev_rel = [1;1;1];
x_curr_rel = [0;0;0];
k_real_rel=0;
spectOfH_D = max(abs(eig(H_D)));
q_opt = 2/(1+sqrt(1-spectOfH_D^2));

while norm(x_curr_rel-x_prev_rel,"inf")>=eps
    x_prev_rel = x_curr_rel;
    for i=1:size(H_D,1)
        sum1 = 0;
        sum2 = 0;
        for j=1:(i-1)
            sum1=sum1 + H_D(i,j)*x_curr_rel(j);
        end
         for j=(i+1):size(H_D,1)
            sum2=sum2 + H_D(i,j)*x_prev_rel(j);
         end
         x_curr_rel(i) = x_prev_rel(i) + q_opt * (sum1+sum2-x_prev_rel(i)+g_D(i));
    end
    k_real_rel=k_real_rel+1;
end
xk= x_curr_rel;
xk_prev = x_prev_rel;
k=k_real_rel;
end

