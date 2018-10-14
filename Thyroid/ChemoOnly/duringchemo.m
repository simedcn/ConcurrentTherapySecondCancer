% This code is for implementing the Chemotherapy
 
close all;
clear all;
clc;

OneCycle = 30; % number of days per cycle
NumbCycles = 10; % number of cycles
TotalDays = OneCycle * NumbCycles; 

t_final = TotalDays + 50; % End of treatment

t = 1:0.001:t_final;
D = 12;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndChemo,t,[1;0],D(i),OneCycle,TotalDays); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_Thyroid(i) = x(end,2*i);
end
Ncells_EndofChemo = x(end,1*i);
PMcells_EndofChemo = x(end,2*i);

ERR_Thyroid
RR = 1+ERR_Thyroid

%figure(1)
%plot(t,x(:,2))

