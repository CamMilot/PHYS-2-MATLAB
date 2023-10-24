eps0 = 8.85*10^-12; k = 1/(4*pi*eps0);
q1 = -1e-3; a = 2.2;
q2 = 1e-3; L = 4;
lambda = q2/L;
[x,y] = meshgrid(-2:0.2:2,0.1:0.2:2);
syms X;
r1=sqrt(x.^2 + (y-a).^2);
r2=sqrt((x-X).^2 + y .^2);
V1 = k*q1./r1;
V2 = k*int(lambda./r2, X, -L/2, L/2);
V=double(V1+V2);
[px,py] = gradient(V,0.1,0.1);
subplot (2,2,1)
contour (x,y,V)
subplot (2,2,2);
surf(x,y,V)
subplot(2,1,2)
quiver (x,y,-px,-py,2)