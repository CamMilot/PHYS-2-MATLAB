C = 1000*10^-6; % capacitance of 1000 microFarad
R = 33*1000; %resistance of 33 kohm
V0 = 5; %maximum voltage (V0)5V
t = 0: 0.01: 200; %time in second 
tau = R*C; %time constant in second 
Vt = V0*(exp(-t/tau));
Yth = log(Vt/V0);
texp = [0 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60];%time in sec
Vexp = [4.984 4.599 4.182 3.792 3.449 3.158 2.874 2.633 2.389 2.176 1.994 1.811 1.649 1.503 1.378 1.252 1.148 1.046 0.951 0.875 .791];%measured voltage in V measured
Yexp = log(Vexp/V0);
subplot(2,1,1); plot(t, Vt, texp, Vexp, 'x');
subplot(2,1,2); plot(t, Yth, texp, Yexp,'x')
coefficients = polyfit(texp, Yexp,1); %linear fitting 
m = coefficients (1);% slope
tauexp = -1/m % time constant calculated from slope 
error = abs(tau-tauexp)/tau*100 %percent error