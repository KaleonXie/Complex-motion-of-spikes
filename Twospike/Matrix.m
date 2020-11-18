function [M1,M2]=Matrix(N,D)
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

M1=1/N*inv(eye(N)+1/6/N^2*G)*((GradG)');
M2=-1/2/D*eye(N)-1/6/N^3*GradG*inv(eye(N)+1/6/N^2*G)*((GradG)');
end