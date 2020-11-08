function y = rungeCutt(x,y0,h)
    y=zeros(size(x));
    y(1)= y0;
    for i=2:size(x,1)
        k1=h*rightPart(x(i-1),y(i-1));
        k2=h*rightPart(x(i-1)+h/2,y(i-1)+k1/2);
        k3=h*rightPart(x(i-1)+h/2,y(i-1)+k2/2);
        k4=h*rightPart(x(i-1)+h,y(i-1)+k3);
        y(i)=y(i-1)+(k1+2*k2+2*k3+k4)/6;
    end
end

