function [T,Y] = call_onespike(par,Y0,tend)
 tspan = [0 tend];
%  y1_0 = 10;
%  y2_0 = -100;
%  Y0=[y1_0 y2_0]';
  Dv=par(1);
k1=par(2);
tau=par(3);
 options = odeset('RelTol',1e-6)
 [T,Y] = ode45(@(t,y) onespike(t,y,par),tspan,Y0,options);
 figure(2)
 hold on;
 plot(T,Y(:,1),'LineWidth',3);
 % plot(T,Y(:,1)-Y(:,3),'r-.',T,Y(:,1)+Y(:,3),'b-.')
%tau_hat=[0.3,0.5,0.7,1,2,4,6,10,12,15,20,25,30,40,50,60,70,80,100 ]*100;
%A_c=[0.0091,0.0162,0.0210,0.0266,0.0401,0.0589,0.0739,0.1007,0.1140,0.1344,0.1708,0.2103,0.2528,0.3460,0.4495,0.5623,0.6839,0.8136,1.0959] 
%A_asym= 0.01*sqrt(0.5*(tau_hat*0.2.^2-1/6/D)/(5/112/0.2)); 
grid on;
end
