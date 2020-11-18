clear all;
close all;
readp0file;


tau=3000;
D=1/500;
N=3;
Y0=[p1(1),p2(1),p3(1), (p1(200)-p1(1))/(t1(200)-t1(1)),(p2(200)-p2(1))/(t1(200)-t1(1)),(p3(200)-p3(1))/(t1(200)-t1(1))];

Q=zeros(N,N);
for i=1:N
Q(i,1)=1/sqrt(N)*(-1)^(i);
end
for j=2:N
    for l=1:N
    Q(l,j)=sqrt(2/N)*sin(pi*(j-1)/N*(l-1/2));
    end
end

%% initial condition for modulation equations.

%xi0=[0.1,0.01,20] %for tau800,1200;
%xi0=[30,20,8] %for tau3000xi1
xi0=[10,30,10] %for tau3000xi2

%% ODE simulation
tt1=t1(t1<400);
tend=tt1(end);
[T,Y] = call_Nspikes(Y0,N,tend,tau,D);
[t,xi] = call_asymNspike(xi0,tend*0.01,N,tau,D);
xipde=[p1,p2,p3]*Q;
xiode=Y(:,1:3)*Q;

%% plot
f1 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);
axes1 = axes('Parent',f1,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes1,'on');

plot(xipde(t1<400,1),tt1,'-','LineWidth',3)
hold on;
plot(xiode(:,1),T,'--','LineWidth',3)
plot(xi(:,1),t*100,'-.','LineWidth',3)
legend('PDE','ODE','Asym')
box(axes1,'on');
grid(axes1,'on');
set(axes1,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');
set(gca,'FontSize',40);

xlim([-10,10])
y1=ylim;
x1=xlim;
xlabel('\xi_1','Position',[0.5*(x1(1)+x1(2))+2.5,y1(1),1])
ylabel('T_1','Position',[x1(1)-0.1,0.5*(y1(1)+y1(2)),1])
xticks('auto')
savefig(f1,'threespikexi1tau3000xi2.fig')
saveas(f1,'threespikexi1tau3000xi2.png')
%%
f2 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);
axes2 = axes('Parent',f2,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes2,'on');
f2=figure(2);
plot(xipde(t1<400,2),tt1,'-','LineWidth',3)
hold on;
plot(xiode(:,2),T,'--','LineWidth',3)
plot(xi(:,2),t*100,'-.','LineWidth',3)

legend('PDE','ODE','Asym')
box(axes2,'on');
grid(axes2,'on');
set(axes2,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');
xlim([-30,30])
y2=axes2.YLim;
x2=axes2.XLim;
xlabel('\xi_2','Position',[0.5*(x2(1)+x2(2))+10,y2(1),1]);
ylabel('T_1','Position',[x2(1)-0.1,0.5*(y2(1)+y2(2)),1])
xticks('auto')
savefig(f2,'threespikexi2tau3000xi2.fig')
saveas(f2,'threespikexi2tau3000xi2.png')

%%
f3 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);

% ´´½¨ axes
axes3 = axes('Parent',f3,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes3,'on');

plot(xipde(t1<400,3),tt1,'-','LineWidth',3)
hold on;
plot(xiode(:,3),T,'--','LineWidth',3)
plot(xi(:,3),t*100,'-.','LineWidth',3)

legend('PDE','ODE','Asym')
box(axes3,'on');
grid(axes3,'on');
set(axes3,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');
xlim([-15,15])
y3=axes3.YLim;
x3=axes3.XLim;
xlabel('\xi_3','Position',[0.5*(x3(1)+x3(2))+2,y3(1),1]);
ylabel('T_1','Position',[x3(1)-0.1,0.5*(y3(1)+y3(2)),1])

xticks('auto')
% savefig(f3,'threespikexi3tau3000xi2.fig')
% saveas(f3,'threespikexi3tau3000xi2.png')
