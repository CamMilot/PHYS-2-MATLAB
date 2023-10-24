L = 4; Q=1*10^-3;
eps0 = 8.85*10^-12; 
k = 1/(4*pi*eps0);lambda = Q/L; a=2; b= 0;

[x,y] = meshgrid(-2:0.2:2,0.1:0.2:2);
syms X;

ra=sqrt((x-X).^2 + (y-a).^2);
rb=sqrt((x-X).^2 + y .^2);
Va = double(int(-lambda*k./ra, X, -L/2, L/2));
Vb = double(int(lambda*k./rb, X, -L/2, L/2));
V=Va + Vb;
subplot (2,2,1)
contour (x,y,V), xlabel 'x', ylabel 'y'
subplot (2,2,2);
surf(x,y,V)
subplot(2,1,2)
[px,py] = gradient(V,0.1,0.1);
quiver (x,y,-px,-py,2)