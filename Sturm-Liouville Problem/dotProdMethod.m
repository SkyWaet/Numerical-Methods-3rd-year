function [eigVal,eigVect] = dotProdMethod(A)
    echo off;
    Yk = zeros(size(A,1),1);    
    Yk(1) = 1;
    [~,p] = max(abs(Yk));
    Yk = Yk ./ Yk(p);
    Yk1 = A*Yk;
    n = 0;     
    
    lambda_k = dot(A*Yk,Yk)/dot(Yk,Yk)-1;
    lambda_k1 = dot(A*Yk,Yk)/dot(Yk,Yk);
    
    epsilon = 0.00001;
    while (abs(lambda_k - lambda_k1)>=epsilon)
        n=n+1;
        Yk = Yk1;
        [~,p] = max(abs(Yk));
        Yk = Yk ./ Yk(p);
        lambda_k = lambda_k1;           
        lambda_k1 =dot(A*Yk,Yk)/dot(Yk,Yk);
        Yk1 = A*Yk;   
        
    end     
    eigVal = lambda_k1;
    eigVect = Yk/norm(Yk);
end

