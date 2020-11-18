
%% Read PDE data produced from flexpde 7. 
readp0file;
%% ODE simulation and plot
tau=1000;
D=1/150;
N=2;
Y0=[p1(1),p2(1), (p1(100)-p1(1))/(t1(100)-t1(1)),(p2(100)-p2(1))/(t1(100)-t1(1))];% initial condition
tt1=t1(t1<400);
tend=tt1(end);

f1 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);

% ´´½¨ axes
axes1 = axes('Parent',f1,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes1,'on');



[T,Y] = call_Nspikes(Y0,N,tend,tau,D);
plot(-0.5+0.01*p1(t1<400),tt1*100,'b-','LineWidth',4)
hold on;
plot(-0.5+0.01*Y(:,1),T*100,'r--','LineWidth',4)


plot(0.5+0.01*p2(t1<400),tt1*100,'b-','LineWidth',4)
hold on;
plot(0.5+0.01*Y(:,2),T*100,'r--','LineWidth',4)



box(axes1,'on');
grid(axes1,'on');
set(axes1,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');
xlim(axes1,[-1 1]);
yl=ylim;
 xl=xlim;
 xlabel('x','Position',[0.2*xl(2),yl(1),1]);
 ylabel('t','Position',[xl(1)-0.1,0.5*(yl(1)+yl(2))+0.1,1])

%% save figure
% savefig(f1,'twospikeoriginaltau1000out.fig')
 % saveas(f1,'twospikeoriginaltau1000out.png')
