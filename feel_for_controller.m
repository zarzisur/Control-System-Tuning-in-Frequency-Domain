clc
close all;
clear all;
%%%%%%%%%%%%       Integrator    (-20db/decade)              %%%%%
%%    Transfer function of integrator =1/s  ,so numarator= 1*s^0 and 
%%%%  denominator =s=1*s^1+0*s^0 , So zero=[1] and pole=[1 0]

zero=[1];
pole=[1 0];
omega=logspace(-3,3);%Omega= 10^-3 to 10^3
g=freqs(zero,pole,omega);%Calculate the value of frequency response of the transfer function
semilogx(omega,20*log10(abs(g)));% plot the absulate value of frequency response
hold on;



%%%%% Proportional Part %%%%%%%%
clc;
clear all;

Kp=100;% Proportional Gain

zero=[Kp];
pole=[1];
omega=logspace(-3,3);%Omega= 10^-3 to 10^3
g=freqs(zero,pole,omega);%Calculate the value of frequency response of the transfer function
semilogx(omega,20*log10(abs(g)));% plot the absulate value of frequency respons
hold on;

%%%%%% Derivative  (+20DB/Decade)  G(s)=s/s+a  ; Because G(s)=s is
%%%%%% Unimplementable                                      %%%%%%%%%%%%%%

clc;
clear all;

a=100;% Proportional Gain

zero=[1 0]; %% s=1*s^1+0*s^0
pole=[1 a];%% s+a=1*s^1+a*s^0
omega=logspace(-3,3);%Omega= 10^-3 to 10^3
g=freqs(zero,pole,omega);%Calculate the value of frequency response of the transfer function
semilogx(omega,20*log10(abs(g)));% plot the absulate value of frequency respons

