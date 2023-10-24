Xexp = [1.8 2.5 3.4 5.3 4.5 4]*10^-2*cosd(15);
Yexp = [.2 .6 1 2.6 1.3 .8]*10^-2;
Rexp = (Xexp.^2 + Yexp.^2)./(2*Yexp);
Rmean = mean(Rexp);
e = 1.6*10^-19;
me = 9.11*10^-31;
N = 320;
R = 0.068;
I = .467;
d = 5.2*10^-2;
Vp = 3*10^3;
B = 8.992*10^-7*N*I/R;
E= 0.77*Vp/d;
v = E/B;
x = 0.02:0.002:0.1;
y = -0.08:0.005:0.08;
x = sqrt(2*y.*Rmean - y.^2);
plot (x,y,x,-y, Xexp, Yexp, 'o')
Rexp
Rmean
ratio_theory = e/me
ratio_expr = v/(Rmean*B)
percent_error = (ratio_expr-ratio_theory)/ratio_theory*100
e_over_m = 2*v^2*Yexp./(E*(Xexp.^2+Yexp.^2))

