function y = advancedEuler(x,y0,step)
   y=zeros(size(x));   
    y(1)= y0;
    for i=2:size(x,1)
        ymiddle = y(i-1)+step*rightPart(x(i-1),y(i-1));
        y(i)=y(i-1)+step/2*(rightPart(x(i-1),y(i-1))+rightPart(x(i),ymiddle));
    end
end