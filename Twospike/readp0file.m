
%% read file SchnakenbergmodelTwoSpiketau1000oop, which contains the information on spike center.
%the reader shall change the file name manually for different \tau values.
fileID=fopen("SchnakenbergmodelTwoSpiketau1000oop.p01");
s=fgetl(fileID)
while (s~="}")
s=fgetl(fileID);
end
A=fscanf(fileID,"%f , %f");
n=length(A);
ttt=A(1:2:(n-1));
x=A(2:2:n);
fclose(fileID);
figure(3);
plot(ttt,x);
t1=ttt*0.01;
p1=(x+1/2)/0.01;

fileID=fopen("SchnakenbergmodelTwoSpiketau1000oop.p02");
s=fgetl(fileID)
while (s~="}")
s=fgetl(fileID);
end
A=fscanf(fileID,"%f , %f");
n=length(A);
ttt=A(1:2:(n-1));
x=A(2:2:n);
fclose(fileID);
hold on;
figure(3);
plot(ttt,x);
p2=(x-1/2)/0.01;




