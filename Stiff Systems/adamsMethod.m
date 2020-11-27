function [Y,W1,W2] = adamsMethod(A,h,Y)
    n = size(Y,2);
    E = eye(size(A,1));
    W1 = (E - 5*h*A/12)^(-1)*(E + 2*h*A/3);
    W2 = (E - 5*h*A/12)^(-1)*(h*A/12);
    for i=2:n-1
        Y(:,i+1) = W1 * Y(:,i) - W2*Y(:,i-1);
    end
end

