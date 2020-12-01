function [Y,s,t] = TMA_algorithm(A,B,C,G)
   Y = zeros(size(A));
   s = zeros(size(A));
   s(1)= C(1)/B(1);
   t = zeros(size(A));
   t(1) = -G(1)/B(1);
   n = size(A,2);
   for i=2:n
       s(i) = C(i)/(B(i)-A(i)*s(i-1));
       t(i) = (A(i)*t(i-1) - G(i))/(B(i)-A(i)*s(i-1));       
   end  
   Y(n)= t(n); 
   for i=(n-1):-1:1
       Y(i) = s(i)*Y(i+1) + t(i);
   end   
end

