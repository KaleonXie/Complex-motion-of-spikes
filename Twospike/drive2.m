close all
clear all
readp0file; % read the data produced by flexpde 7
tau=1000;
D=1/150;
N=2;
Y0=[p1(1),p2(1), (p1(100)-p1(1))/(t1(100)-t1(1)),(p2(100)-p2(1))/(t1(100)-t1(1))];

Q=zeros(N,N);
for i=1:N
Q(i,1)=1/sqrt(N)*(-1)^(i);
end
for j=2:N
    for l=1:N
    Q(l,j)=sqrt(2/N)*sin(pi*(j-1)/N*(l-1/2));
    end
end
%% initial condition for modulation equations
%xi0=[20,5] %for tau 50;
%xi0=[20,9] %for tau 500;
xi0=[20,5] %for tau 1000out;
%xi0=[5,20] %for tau1000in;

%% ODE simulation
tt1=t1(t1<400);
tend=tt1(end);
[T,Y] = call_Nspikes(Y0,N,tend,tau,D);
[t,xi] = call_asymNspike(xi0,tend*0.01,N,tau,D);
xipde=[p1,p2]*Q;
xiode=Y(:,1:2)*Q;


f1 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);

% 创建 axes
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

% set(gcf,'units','normalized','outerposition', outerpos);
% set(gca,'Position',pos,'LineWidth',2)
%figure('units','normalized','outerposition',[0 0 1 1])
xlim([-10,10])

y1=ylim;
x1=xlim;
xlabel('\xi_1','Position',[0.5*(x1(1)+x1(2))+2.5,y1(1),1])
ylabel('T_1','Position',[x1(1)-0.1,0.5*(y1(1)+y1(2))+25,1])
xticks('auto')

f2 = figure('units','normalized','OuterPosition',...
    [0.494270833333333 0.0162037037037037 0.466145833333333 0.948148148148148]);

% 创建 axes
axes2 = axes('Parent',f2,'Position',[0.1185 0.1186 0.8315 0.8003]);
hold(axes2,'on');

plot(xipde(t1<400,2),tt1,'-','LineWidth',4)
hold on;
plot(xiode(:,2),T,'--','LineWidth',4)
plot(xi(:,2),t*100,'-.','LineWidth',4)
legend('PDE','ODE','Asym')
box(axes2,'on');
grid(axes2,'on');
set(axes2,'FontSize',40,'LineWidth',2,'XMinorGrid','on','YMinorGrid','on',...
    'ZMinorGrid','on');


% set(gca,'FontSize',40);
% set(gcf,'units','normalized','outerposition', outerpos);
%set(gcf,'units','normalized','Position', [0.1,0.1,0.85,0.85]); set(gcf,
%'Position', get(0, 'Screensize'));
% set(gca,'Position',pos,'LineWidth',2)
xlim([-15,15])
y2=axes2.YLim;
x2=axes2.XLim;
xlabel('\xi_2','Position',[0.5*(x2(1)+x2(2))+5,y2(1),1]);
ylabel('T_1','Position',[x2(1)-0.1,0.5*(y2(1)+y2(2))+25,1])

xticks('auto')


% % 
 savefig(f1,'twospikexi1tau1000out.fig')
 saveas(f1,'twospikexi1tau1000out.png')
% 
 
savefig(f2,'twospikexi2tau1000out.fig')
 saveas(f2,'twospikexi2tau1000out.png')