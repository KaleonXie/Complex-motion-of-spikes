fileID=fopen("SchnakenbergmodelThreeSpiketau3000xi2.p01");
s=fgetl(fileID)
while (s~="}")
s=fgetl(fileID);
end
A=fscanf(fileID,"%f , %f");
n=length(A);
ttt=A(1:2:(n-1));
x=A(2:2:n);
fclose(fileID);
figure(5);
plot(ttt,x);
t1=ttt*0.01;
p1=(x+2/3)/0.01;

fileID=fopen("SchnakenbergmodelThreeSpiketau3000xi2.p02");
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
figure(5);
plot(ttt,x);
p2=(x)/0.01;

fileID=fopen("SchnakenbergmodelThreeSpiketau3000xi2.p03");
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
figure(5);
plot(ttt,x);
p3=(x-2/3)/0.01;






