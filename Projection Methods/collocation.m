
function [A,b,c] = collocation(n, L_at_coord,f)
    roots = sort(col_roots(n));
    A = zeros(n,n);
    b = zeros(n,1);
    % Заполнение системы для нахождения коэффициентов 
    for i=1:n
        for j=1:n
            A(i,j) = subs(L_at_coord(j),roots(i));
        end
        b(i) = subs(f,roots(i));
    end
    c = linsolve(A,b);
end

% Функция для генерации корней многочлена Чебышева первого рода
function col_roots = col_roots(n)
    roots = zeros(1,n);
    for i=1:n
        roots(i) = cos((2*i-1)/(2*n) * pi);
    end
    col_roots = roots;
end