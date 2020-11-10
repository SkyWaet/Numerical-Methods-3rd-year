function g = Gauss(M)
    echo off;
    A = M;
    sizeOfA = size(A,1);
    %Прямой ход метода Гаусса 
    for i = 1:sizeOfA
        [~,maxInd] = max(A(:,i));%выбор ведущего элемента
        if (i<maxInd)
          
            Buffer = A(i,:);
            A(i,:)=A(maxInd,:);
            A(maxInd,:) = Buffer;
        end
        A(i,:) = A(i,:)./A(i,i);
        %Непосредственно алгоритм, описанный в пунтке А)
        if((i+1)<=sizeOfA)
            for j = (i+1):sizeOfA        
                A(j,:) = A(j,:)-A(i,:).*A(j,i);
            end
        end
    end
    %Обратный ход метода Гаусса
    x=A(:,sizeOfA+1);
    for i = sizeOfA:-1:1
        if(i<sizeOfA)
            Sum = 0;
            for j = (i+1):sizeOfA
                Sum = Sum +x(j)*A(i,j);
            end
            x(i)=A(i,sizeOfA+1)-Sum  ;
        end    
    end
    g = x;
end