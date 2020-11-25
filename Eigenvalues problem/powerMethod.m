function [eigVal,eigVect,n] = powerMethod(A)
    
    Yk = zeros(size(A,1),1);    
    Yk(1) = 1;
   
    [~,p] = max(abs(Yk));
    Yk = Yk ./ Yk(p);
    Yk1 = A*Yk;    
    n = 0;     
    lambda = Yk1(p);
    eval = norm(A*Yk - lambda*Yk)/norm(Yk);
    epsilon = 0.001;
    while (eval>=epsilon)
        n=n+1;
        Yk = Yk1;
        [~,p] = max(abs(Yk));
        Yk = Yk ./ Yk(p);
        Yk1 = A*Yk;
        lambda = Yk1(p);
        eval = norm(A*Yk - lambda.*Yk)/norm(Yk);
    end     
    eigVal = lambda;
    eigVect = Yk./norm(Yk);
end

