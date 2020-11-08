function y = Euler(x,y0,step)    
    y=zeros(size(x));
    y(1)= y0;
    for i=2:size(x,1)
        y(i)=y(i-1)+step*rightPart(x(i-1),y(i-1));
    end
end

