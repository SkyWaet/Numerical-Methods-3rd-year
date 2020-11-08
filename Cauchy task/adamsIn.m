function y = adamsIn(x,y_Ad_ex,h)
      epsilon = 0.00001; 
      y=y_Ad_ex;
      func = @(t,c)((t-1).*t.*(t+1).*(t+2).*(t+3))./(t+c);  
      q = h.*rightPart(x,y); 
      for i=5:size(x)-1
        yk=y_Ad_ex(i+1)+1;
        yk1 = y_Ad_ex(i+1);
        while abs(yk1-yk)>=epsilon
            yk=yk1;
            sum = 0;
            for j=-1:3
                bkj = (-1)^(j+1)/(factorial(j+1)*factorial(3-j))*integral(@(t) func(t,j),0,1);
                sum = sum + bkj*q(i-j);
            end
            yk1 = y(i) + sum;
            q(i+1)=h*rightPart(x(i+1),yk1);            
        end
        y(i+1)=yk1;
      end
end

