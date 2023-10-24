clear all 
 diary ('Lab202'); 
 diary on 
 eps0 = 8.85*10^-12; k = 1/(4*pi*eps0); 
 q1 = 90*10^-9; 
 syms x y z; 
 xo = 0;
 yo = 0;
 zo = 0;
 E = @(x,y,z) k*q1/((x-xo)^2+(y-yo)^2+(z-zo)^2)^(3/2)*[x-xo,y-yo,z-zo]; 
 I = [1,0,0];J = [0,1,0];K=[0,0,1]; 
 a = 1;
 Etop = dot(K,E(x,y,a)); 
 Ebottom = dot(-K, E(x,y,-a)); 
 Eleft = dot(-J, E(x,-a,z)); 
 Eright = dot(J, E(x,a,z)); 
 Efront = dot(I, E(a,y,z)); 
 Eback = dot(-I, E(-a,y,z)); 

 Phitop = int(int(Etop, x,-a,a), y,-a,a); 
 Phibottom = int(int(Ebottom, x, -a, a), y, -a,a); 
 Phileft = int(int(Eleft, x, -a, a), z, -a, a); 
 Phiright = int(int(Eright, x, -a, a), z, -a, a); 
 Phifront = int(int(Efront, y, -a, a), z, -a,a); 
 Phiback = int(int(Eback, y, -a, a), z, -a, a); 

 vpa(Phitop, 10) 
 vpa(Phibottom, 10) 
 vpa(Phileft, 10) 
 vpa(Phiright, 10) 
 vpa(Phifront, 10) 
 vpa(Phiback, 10) 
 ALL_Phi = Phitop + Phibottom + Phileft + Phiright + Phifront + Phiback; 
 vpa(ALL_Phi, 5) 
 vpa(eps0*ALL_Phi, 5) 
