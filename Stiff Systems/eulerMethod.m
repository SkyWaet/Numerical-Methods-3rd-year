function [Y,W] = eulerMethod(A,h,Y)
    n = size(Y,2);
    W = (eye(size(A,1)) + A*h);
    for i=1:(n-1)
        Y(:,i+1) = W *Y(:,i);
    end     
end

