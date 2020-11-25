function [ik,jk] = findMax(A)
    max = 0;
    maxElemRow = 1;
    maxElemCol = 2;
    for i = 1:size(A,1)
       for j = (i+1):size(A,1)
           if(abs(A(i,j))>max)
                maxElemRow = i;
                maxElemCol = j;
                max = abs(A(i,j));
           end    
       end    
    end          
    ik = maxElemRow;
    jk = maxElemCol;
end

