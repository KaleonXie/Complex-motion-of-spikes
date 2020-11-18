%% read pde data from the file `SchnakenbergmodelOneSpiketau100.p01' produced from flexpde. 
readp01file;

%% set values for ODE simulation.
par=[0.2,0.2,100];
Dv=par(1);
k1=par(2);
tau=par(3);
tend=tt(end);
Y0=[10,-100]'; % initial condition
%% simulation of ODE and modulation equation.
[T,Y] = call_onespike(par,Y0,tend);
[t,y] = call_asymonespike(par,tend);
