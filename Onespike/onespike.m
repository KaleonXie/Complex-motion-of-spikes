function dy = onespikes(t,y,par)
 dy = zeros(2,1);
 Dv=par(1);
k1=par(2);
tau=par(3);
dy(1)=k1*y(2)-0.01*(y(1)/6/Dv+2.24*k1*y(2)/36/Dv);
dy(2)=-y(1)/6/Dv+0.01*( tau*k1^2*y(2)-5/7*k1*y(2)^3+y(1)*(2.38/6^3/Dv^2) );
end
