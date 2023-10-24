D = .2;
A = pi*D^2/4;
dexp = [.8705 1.2250 2.1000 2.45 3.1062 3.5437 4.3750 5.1625 6.2125 7.1313 8.1375 9.0125 10.0188]*10^-3;
Cexp = [297 217 131 112 88.10 77.90 62.90 53.20 44.20 38.40 33.40 30.10 26.60]*10^-12;
eps0 = 8.85*10^-12;
kappa = 1;
eps = kappa*eps0;
d = 0.0009: 0.00001: 0.015;
Cth = eps*A./d;
subplot (1,2,1)
plot(d, Cth, dexp, Cexp, 'o')
subplot(1,2,2)
plot(1./d, Cth, 1./dexp, Cexp, 'o')
Invdexp = 1./dexp;
coefficent = polyfit(Invdexp,Cexp, 1)
eps0exp = coefficent (1)/A