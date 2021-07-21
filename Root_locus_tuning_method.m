%This is a script file to demonstrate the root locus technique of Boost
%converter controller design

%Model of the plant . Let us take a arbitraty model


% model for non isolated boost converter %

clear all;
clc
disp(['The value of plant parameter']);
Vg=15;
D=0.4;
L=2e-3;
C=10e-6;
R=100;
Ts=50e-6;


% steady state model of the boost converter given by As, Bs, Cs and Ds
% matrices

As= [0 -(1-D)/L ;(1-D)/C -1/(R*C)];
Bs=[1/L 0 0;0 -1/C 0];
Cs=[0 1;1 0];
Ds=[0 0 0;0 0 0 ];

Vo= -Cs(1,:)*inv(As)*Bs(:,1)*Vg
Ig= -Cs(2,:)*inv(As)*Bs(:,1)*Vg


%Small Signal Model of the Boost converter
a=[0 -(1-D)/L; (1-D)/C -1/R/C];

b= [1/L 0 Vo/L; 0 -1/C -Ig/C];% Ig and Vo is taken from steady state model


c=[0 1];
d=[0 0 0];
ulabels=['vg iz d'];
ylabels=['vo ig'];
xlabels=['il vc'];

%printsys(As,Bs,Cs,Ds,ulabels,ylabels,xlabels)

disp(['Transfer function in s-domain'])
disp(['vo/d(s)'])
TFboost=zpk(tf(ss(a,b(:,3),c,[0])))
[ng,dg]=ss2tf(a,b(:,3),c,[0])







% Define the controller stucture

ngc=[1];
dgc=[1 0]; %s ,integrator only


%define transfer fucton

nh=[1];
dh=[1];

% Loop Transfer function

nl= conv(conv(ng,ngc),nh);
dl= conv(conv(dg,dgc),dh);

flag=1;
while flag~=0
    [k,p]=rlocfind(nl,dl);
 
    [nc,dc]=feedback(conv(ng,ngc)*k,conv(dg,dgc),nh,dh);
    step(tf(nc,dc),100);
    flag=input('Enter 0 to quit or 1 to continue=');
end








