function dy = Nspikes(t,y,tau,N,D)
NN=2*N;
k1=0.2;
nu1=4.12/6^3/D/N^3 +3.81/6^4/D/N^3;
nu2=4/6^2/N^2;
dy=zeros(NN,1);
dy(1:N) = zeros(1,N);
dy((N+1):NN)=zeros(1,N);
[M1,M2]=Matrix(N,D);
dy(1:N)=k1*y((N+1):NN)+0.01*(M2*(y(1:N))/3/N+k1*y((N+1):NN).*(M1*y(1:N)/6/N+2.08/6^2/D/N^2));
dy((N+1):NN)=M2*(y(1:N))/3/N+ 0.01*(tau*k1^2*y((N+1):NN)-5*k1/7*y((N+1):NN).^3-nu1*M2*y(1:N)-nu2*((M2*y(1:N)).*(M1*y(1:N))) );
end

