%PID controller with a Plant Transfer Function
clear all;
close all;
clc
% Controller
ki=0.2;
kp=1;
nc=[kp ki];% numarator(ki*s^0)
dc=[1 0];%denominator (1*s^1+0*s^0)
w=logspace(-3,3);% take frequency from 10^-3 to 10^3
gc=freqs(nc,dc,w);% obtain transfer function values on those freq
subplot(2,1,1),semilogx(w,20*log10(abs(gc)),'k');hold;pause;%plot magnitude of TF


%Plant

np=[2.2]; % numarator(2.2*s^0)
dp=conv(conv([0.1 1],[0.4 1]),[1.2 1]); %denominator=(0.1s+1)*(0.4s+1)*(1.2s+1)

% conv is used because it is a 3rd order system and 3 `st order factor is
% being multiplied using conv function

gp=freqs(np,dp,w);% obtain transfer function value of plant

subplot(2,1,1),semilogx(w,20*log10(abs(gp)),'r');pause;

%plant + controller 

gpc=freqs(conv(np,nc),conv(dp,dc),w);

subplot(2,1,1),semilogx(w,20*log10(abs(gpc)),'b');hold;pause;

% step response of closed loop system
[ns,ds]=feedback(conv(np,nc),conv(dp,dc),[1],[1]);
subplot(2,1,2),step(ns,ds,15)




