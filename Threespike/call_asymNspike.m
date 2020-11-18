function [t,y] = call_asymNspike(y0,tend,N,tau,D)
tspan = [0 tend]; % set time interval
[t,y] = ode15s( @(t,y) myodeN(t,y,N,tau,D) ,tspan ,y0);

% Q=zeros(N,N);
% for i=1:N
% Q(i,1)=1/sqrt(N)*(-1)^(i);
% end
% for j=2:N
%     for l=1:N
%     Q(l,j)=sqrt(2/N)*sin(pi*(j-1)/N*(l-1/2));
%     end
% end

function dy = myodeN (t,y,N,tau,D)

k1=0.2;
dy=zeros(N,1);

[B,lambda]=MatrixB(N,D);

if sum(lambda>0)>0
    fprintf('"one of the eigenvalues is positive" \n')
end

for i=1:N
dy =y.*( 1/2*(tau*k1^2+lambda'/3/N)+5/56*(B')*(y.^2) );
end

end

function [B,lambda]=MatrixB(N,D)
P=zeros(N,N);
P(:,1)=1/sqrt(N)*ones(N,1);
for j=2:N
    for l=1:N
    P(l,j)=sqrt(2/N)*cos(pi*(j-1)/N*(l-1/2));
    end
end
Q=zeros(N,N);
for i=1:N
Q(i,1)=1/sqrt(N)*(-1)^(i+1);
end
for j=2:N
    for l=1:N
    Q(l,j)=sqrt(2/N)*sin(pi*(j-1)/N*(l-1/2));
    end
end    
QQ=Q';
lambda=ones(1,N);
lambda(1)=-1/2/D;
for i=2:N
lambda(i)=-1/2/D-1/(6*N^3*2^2*D^2)/(tan(pi*(i-1)/2/N))^2/(1-1/(12*D*N^3*(sin(pi*(i-1)/2/N))^2)) ;
end

B=zeros(N,N);
for i=1:N
    for j=1:N
        if j==i
        B(i,j)=1/N*lambda(i)*( QQ(j,:)*((Q(:,j)).^3) );
        else
        B(i,j)=2/N*lambda(i)*(QQ(j,:)*((Q(:,i)).^2.*Q(:,j)) );
        end
    end
end

end

end