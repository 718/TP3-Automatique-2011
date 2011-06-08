clc; clear all; close all;

%% TP3 1.3 Rejet de perturbations

% les matrices:

Aa = [-2 0;1 0];
Ba = [1;0];
Ea = [1;0];
Da = [0;-1];

Ca = [1 0];

% Correcteur Ka:
k1 = 4;
k2 = 9;
Ka = [k1 k2];


%Fonction de sensibilite:
[num,den] = ss2tf(Aa-Ba*Ka,Ea,Ca,0);
SYS = tf(num,den)

bode(SYS)
grid on
title('Fonction de sensibilite')


% Transfert de boucle:
N = 5;
h = ones(1,N)
B = 1;

for i = 1:N
    h(i) = i;
    [num1,den1] = ss2tf(Aa-Ba*Ka,[B*h(i);-1],Ca,0);
    SYS2 = tf(num1,den1);
    figure(2)
    hold on
    bode(SYS2)
    grid on
end
