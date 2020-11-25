function [eigVals,X] = jacobiMethod(A)
    echo off;
    X = eye(size(A,1));
   
    Ak = A;
    Ak1 = A;
    [ik,jk] = findMax(Ak);
    eps =  0.000001;
    
    while(abs(Ak1(ik,jk))>=eps)
        Ak = Ak1;
        d = sqrt((Ak(ik,ik) - Ak(jk,jk))^2 + 4*Ak(ik,jk)^2);
        c = sqrt(0.5*(1+abs((Ak(ik,ik) - Ak(jk,jk)))/d));
        s = sign(Ak(ik,jk)*(Ak(ik,ik)-Ak(jk,jk)))*sqrt(0.5*(1-abs((Ak(ik,ik) - Ak(jk,jk)))/d));   
        V = eye(size(A,1));        
        V(ik,ik) = c;
        V(jk,jk) = c;
        V(ik,jk) = -s;
        V(jk,ik)= s;
        Ak1 = V.' * Ak * V;
        X = X * V;
       [ik,jk] = findMax(Ak1);
    end  
    eigVals = Ak1;
    
end

