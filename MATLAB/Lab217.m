C = 1000*10^-6; % capacitance of 1000 microFarad
R = 33*1000; %resistance of 33 kohm
V0 = 5; %maximum voltage (V0)5V
t = 0: 0.01: 200; %time in second 
tau = R*C; %time constant in second 
Vt = V0*(1-exp(-t/tau));
Yth = log(1-Vt/V0);
texp = [0 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60];%time in sec
Vexp = [0 0.436 0.824 1.201 1.555 1.835 2.140 2.348 2.603 2.823 3.016 3.181 3.342 3.479 3.671 3.739 3.853 3.947 4.039 4.117 4.186];%measured voltage in V measured
Yexp = log(1-Vexp/V0);
subplot(2,1,1); plot(t, Vt, texp, Vexp, 'x');
subplot(2,1,2); plot(t, Yth, texp, Yexp,'x')
coefficients = polyfit(texp, Yexp,1); %linear fitting 
m = coefficients (1);% slope
tauexp = -1/m; % time constant calculated from slope 
error = abs(tau-tauexp)/tau*100 %percent error