eps0 = 8.85*10^-12; k = 1/(4*pi*eps0);
q1 = 1e-9;
q2 = -1e-9;
a=1;
[x,y] = meshgrid(-2.1:0.2:2.1, -2.1:0.2:2.1);
r1=sqrt((x+a).^2+y.^2);
r2=sqrt((x-a).^2+y.^2);
V1 = k*q1./r1;
V2 = k*q2./r2;
V=double(V1+V2);
[px,py] = gradient(V,0.01,0.01);
subplot (2,2,1)
contour (x,y,V)
subplot (2,2,2);
surf(x,y,V)
subplot(2,1,2)
quiver (x,y,-px,-py)