function y = adamsEx(x,y_RK,h)
    y = [y_RK;(zeros(size(x,1)-5,1))];
    func = @(t,c)(t.*(t+1).*(t+2).*(t+3).*(t+4))./(t+c);  
    q=h.*rightPart(x,y);
    for i=5:size(x,1)-1
        sum = 0;
        for j=0:4
            bj = (-1)^j /(factorial(j)*factorial(4-j))* integral(@(t) func(t,j),0,1);
           sum = sum  + bj * q(i-j);
        end
       y(i+1)=y(i)+sum;
       q(i+1)= h*rightPart(x(i+1),y(i+1));
    end    
end

