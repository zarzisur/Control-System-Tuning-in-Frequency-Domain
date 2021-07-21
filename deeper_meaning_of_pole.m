
%%%% See from Pole zero map, the transfer function which has 
%%%% pole in real axis , are damped and no oscillation. Which has
%%%% pole in imaginary axis/ imginary plane, are oscillatory.The more 
%%%% they are away from real axis , the more they show oscillation,
clc
clear all
close all
TF1=tf([1 1],[1 3 1]);
TF2=tf([1 1],[1 2.5 1]);
TF3=tf([1 1],[1 2 1]);
TF4=tf([1 1],[1 1.7 1]);
TF5=tf([1 1],[1 0.3 1]);
TF1
TF2
TF3
TF4
TF5

figure(1)
pzmap(TF1);
grid on
hold on
pzmap(TF2);
hold on
pzmap(TF3);
hold on
pzmap(TF4);
hold on
pzmap(TF5);
legend('TF1','TF2','TF3','TF4','TF5');

figure(2)
step(TF1)
hold on
step(TF2)
hold on
step(TF3)
hold on
step(TF4)
hold on
step(TF5)
legend('TF1','TF2','TF3','TF4','TF5');

figure(3)
bode(TF1)
hold on
bode(TF2)
hold on
bode(TF3)
hold on
bode(TF4)
hold on
bode(TF5)
legend('TF1','TF2','TF3','TF4','TF5');
