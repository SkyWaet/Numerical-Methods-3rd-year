
function[ A, b, c ]= min_squares(n,L_at_coord,f)
    A = zeros(n,n);
    b = zeros(n,1);  
    % Заполнение системы для нахождения коэффициентов 
    for i=1:n
        for j=1:n
            A(i,j) = dot_prod(L_at_coord(j),L_at_coord(i));
        end
            b(i) = dot_prod(f,L_at_coord(i));
    end
    c = linsolve(A,b);
end

% Функция для вычисления скалярного произведения в L2
function dot_prod = dot_prod(f1,f2)
    dot_prod = vpaintegral(f1*f2,-1,1);
end