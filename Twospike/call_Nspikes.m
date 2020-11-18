function [T,Y] = call_Nspikes(Y0,N,tend,tau,D)
 tspan = [0 tend];
 options = odeset('RelTol',1e-6);

 [T,Y] = ode45(@(t,y) Nspikes(t,y,tau,N,D),tspan,Y0,options);

%figure(2);
%hold on;
%plot(T,Y(:,1),'b-.',T,Y(:,2),'r-.')
%grid on;
end