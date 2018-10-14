% This code is for implementing the concurrent therapy assuming only
% One chemotherapy cycle with 21 days/cycle and 20 fractions

close all;
clear all;
clc;

OneCycle = 30; % number of days
NumbCycles = 10;
TotalDays = OneCycle * NumbCycles;

t_final = TotalDays + 50; % 20 days added for saturation
t = 1:0.001:t_final;

DC = [12]; % Chemo Dose
DR = 20; % Rad Dose

x = zeros(length(t),length(DC)*2);

for i = 1:length(DC)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndConc1,t,[1;0],DC(i),DR,OneCycle,TotalDays); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_Thyroid(i) = x(end,2*i)*1.0;
    RR = ERR_Thyroid+1;
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);
ERR_Thyroid
RR = 1+ERR_Thyroid


















