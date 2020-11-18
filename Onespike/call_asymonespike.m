function [t,y] = call_asymonespike(par,tend)
 Dv=par(1);
k1=par(2);
tau=par(3);
tend=tend*0.01;
tspan = [0 tend]; % set time interval
y0 = (16); % set initial condition
% dstate evaluates r.h.s. of the ode
[t,y] = ode45(@(t,y) myode(t,y,par) ,tspan ,y0);
figure(2);hold on; plot(t*100,y,'.-','LineWidth',3);
disp([t,y]); % displays t and y(t)
function dydt = myode (t,y,par)
tau=par(3);
k1=par(2);
Dv=par(1);
dydt =0.5*(tau*k1^2-1/6/Dv)*y-5/112/Dv*y^3;
end
end