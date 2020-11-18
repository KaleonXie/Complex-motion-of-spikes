clear all;
N=3;
D=1/50;

Q=zeros(N,N);
for i=1:N
Q(i,1)=1/sqrt(N)*(-1)^(i+1);
end
for j=2:N
    for l=1:N
    Q(l,j)=sqrt(2/N)*sin(pi*(j-1)/N*(l-1/2));
    end
end
x=ones(1,N);
for i=1:N
    x(i)=-1+(2*i-1)/N;
end
GradG=zeros(N,N);

for j=1:N
    for i=1:N
        if i<j
            GradG(i,j)=x(i)+1;
        elseif i>j
            GradG(i,j)=x(i)-1;
        elseif i==j
            GradG(i,j)=x(i);
        end
    end
end
GradG=-1/2/D*GradG;

G=zeros(N,N);
for i=1:N
    for j=1:N
        G(i,j)=1/2/D*abs(x(i)-x(j))+1/2/D*(-1/3-x(i).^2/2-x(j).^2/2);
    end
end


M_2=-1/2/D*eye(N)-1/6/N^3*GradG*inv(eye(N)+1/6/N^2*G)*((GradG)');
M_2=M_2/3/N;
M_1=1/6/N^3*GradG*inv(eye(N)+1/6/N^2*G);

lambda=ones(1,N);
lambda(1)=-1/2/D;
for i=2:N
lambda(i)=-1/2/D-1/(6*N^3*2^2*D^2)/(tan(pi*(i-1)/2/N))^2/(1-1/(12*D*N^3*(sin(pi*(i-1)/2/N))^2)) ;
end

QQ=Q';
disp(' Q^T*M_2*Q=')
disp(Q'*M_2*Q)



B=zeros(N,N);
for i=1:N
    for j=1:N
        if i==j
        B(i,j)=1/N*lambda(i)*( QQ(j,:)*((Q(:,j)).^3) );
        else
        B(i,j)=2/N*lambda(i)*(QQ(j,:)*((Q(:,i)).^2.*Q(:,j)) );
        end
    end
end

            
