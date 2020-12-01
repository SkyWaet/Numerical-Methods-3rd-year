function x = acc_solution
solinit = bvpinit(linspace(-1,1,21), [0 0]);
sol = bvp4c(@ode2, @bc2, solinit);
t = sol.x;
x = sol.y(1, :);
end

function du = ode2(t,u)
du = [u(2), -(0.5 - t/3 - (1-0.5*exp(t/2))*u(1) - (1+t/3)*u(2))/((7-t)/(8+3*t))];
end

function res = bc2(ua, ub)
res =[ua(1), ub(1)];
end

