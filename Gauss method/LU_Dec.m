function [L,U] = LU_Dec(A)
    echo off
    sizeOfA = size(A,1);
    Sum1=0;
    Sum2=0;
    L = eye(sizeOfA);
    U = eye(sizeOfA);

    for i = 1:sizeOfA
        for j=i:sizeOfA
          for k = 1:(i-1)
            Sum1 =Sum1+ L(j,k)*U(k,i);
          end
            L(j,i)= A(j,i) - Sum1;
         for k = 1:(i-1)
            Sum2 = Sum2+L(i,k)*U(k,j);
         end
         U(i,j)=(A(i,j)-Sum2)/L(i,i);
         Sum1=0;
         Sum2=0;
        end
    end
end

