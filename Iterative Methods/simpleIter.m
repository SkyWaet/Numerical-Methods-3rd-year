function [xk,xk_prev,k] = simpleIter(H,g,eps)
    x_curr = [0;0;0];
    x_prev = [1;1;1];
    k_real = 0;
    while norm(x_curr-x_prev)>=eps
        x_prev = x_curr;
        x_curr = H*x_prev+g;
        k_real=k_real+1;
    end
    
    xk=x_curr;
    xk_prev = x_prev;
    k=k_real;
end

