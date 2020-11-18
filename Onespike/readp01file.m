fileID=fopen("SchnakenbergmodelOneSpiketau100.p01");
s=fgetl(fileID)
while (s~="}")
s=fgetl(fileID);
end
A=fscanf(fileID,"%f , %f");
n=length(A);
t=A(1:2:(n-1));
x=A(2:2:n);
fclose(fileID);
figure(2);
hold on;
plot(t*0.01,x/0.01,'LineWidth',3);
xx=x/0.01;
tt=t*0.01;