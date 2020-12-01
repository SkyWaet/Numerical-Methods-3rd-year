function [A,B,C,G] = coefficients(x0,xn,h)
    x = x0:h:xn;
    n = size(x,2);
    A = zeros(size(x));
    B = zeros(size(x));
    C = zeros(size(x));
    G = zeros(size(x));
    for i=2:size(x,2)-1
        A(i) = -(p(x(i))/h^2 + q(x(i))/(2*h));
        B(i) = -(2*p(x(i))/h^2 + r(x(i)));
        C(i) = q(x(i))/(2*h) - p(x(i))/h^2;
        G(i) = f(x(i));        
    end
    
    B(1) = -1/h; 
    B(n) = -1/h;
   
end

function p = p(x)
p = (7-x)/(8+3*x); 
end

function q = q(x)
q = 1+x/3; 
end

function r = r(x)
r = 1-0.5*exp(0.5*x); 
end

function f = f(x)
f = 0.5 - x/3; 
end
