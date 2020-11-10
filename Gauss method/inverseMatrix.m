function invA = inverseMatrix(L,U)
echo off;
    n = size(L,1);
    I = eye(n);
    invA = eye(n);
    for i = 1:n
        y=Gauss([L,I(:,i)]);
        invA(:,i)=Gauss([U,y]);
    end
end

