clear all;
close all;
readp0file;
tau=3000;
D=1/500;
N=3;
Y0=[p1(1),p2(1),p3(1), (p1(200)-p1(1))/(t1(200)-t1(1)),(p2(200)-p2(1))/(t1(200)-t1(1)),(p3(200)-p3(1))/(t1(200)-t1(1))];
tt1=t1(t1<400);
tend=tt1(end);
[T,Y] = call_Nspikes(Y0,N,tend,tau,D);
%% plot
f1 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);
axes1 = axes('Parent',f1,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes1,'on');

plot(-2/3+0.01*p1(t1<400),tt1*100,'b-','LineWidth',3)
hold on;
plot(-2/3+0.01*Y(:,1),T*100,'r--','LineWidth',3)
plot(0.01*p2(t1<400),tt1*100,'b-','LineWidth',3)
hold on;
plot(0.01*Y(:,2),T*100,'r--','LineWidth',3)
hold on;
plot(2/3+0.01*p3(t1<400),tt1*100,'b-','LineWidth',3)
hold on;
plot(2/3+0.01*Y(:,3),T*100,'r--','LineWidth',3)
%% set figure properties
box(axes1,'on');
grid(axes1,'on');
set(axes1,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');
xlim(axes1,[-1 1]);
yl=ylim;
 xl=xlim;
 xlabel('x','Position',[0.2*xl(2),yl(1),1]);
 ylabel('t','Position',[xl(1)-0.1,0.5*(yl(1)+yl(2))+5,1])
 %axes1.YAxis.Exponent = 3;

%  savefig(f1,'threespikeoriginaltau3000xi2.fig')
%  saveas(f1,'threespikeoriginaltau3000xi2.png')

