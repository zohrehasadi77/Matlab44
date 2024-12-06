clc 
clear all
format short
syms XA YA XB YB XC YC alfa beta gama 
X=[XA,YA,XB,YB,XC,YC,alfa,beta,gama];
alfa1=82.5763;
beta1=56.7916;
gama1=40.6315;
d1=282.84;
d2=185.55;
d3=249.94;
xa=1000;
ya=1000;
xb=1200;
yb=800;
xc=950.94;
yc=821.05;
Xm=[xa,ya,xb,yb,xc,yc,alfa1,beta1,gama1];
F=[atan((XB-100)/(YB-100))-alfa
    180-atan((XC-XB)/(YC-YB))-atan((100-XB)/(100-YB))-gama
    atan((100-XC)/(100-YC))-180+atan((XB-XC)/(YB-YC))-beta]
for i=1:3
    for j=1:2
        RondF=diff(F(i,1),X(1,j+2));
        A(i,j)=subs(RondF,X,Xm);
    end      
end
W=[atand((xb-100)/(yb-100))-alfa1
    180-atand((xb-xc)/(yc-yb))-atand((xb-100)/(yb-100))-gama1
    atand((100-xc)/(100-yc))+atand((xb-xc)/(yc-yb))-beta1]
p=[1/4 0 0
    0 1/4 0
    0 0 1/4]
%p=eye(6,6)
s=-inv(A'*p*A)*(A'*p*W)
h=vpa(s)
u=[xb;yb;xc;yc];
a=1;
for i=1:2
   x(1,i)=u(a,1)+h(a,1)
   a=a+1;
end
k=norm(s)
vpa(k)
v=A*s+W
f=vpa(v)
r=f'*p*f
i=r/2