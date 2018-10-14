% This code is for implementing RT 
% Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

% This code is for Radiation Therapy

t_final = 40;
D = 0:1:43;
t = 1:0.01:t_final;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRad,t,[1;0],D(i)); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_breast(i) = x(end,2*i)*1.2;  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

figure(1)
hold on
plot(D,ERR_breast)

%------- Thyroid ERR data due to HL from Shuryak--------% 

A = dlmread('SBBreastValues.txt','\t');

x = A(:,1);
y = A(:,2);

M = dlmread('SBBreast-ErrorBars.txt','\t');

temp1 = M(:,1);
temp2 = M(:,2);

for j = 1:length(temp2)    
    if (mod(j,2) == 0)        
        ly(j) = temp2(j);
    end
    if (mod(j,2) == 1) 
        uy(j) = temp2(j);
    end
end

l = ly(find(ly~=0));
u = uy(find(uy~=0));
for i = 1:length(y)    
    L(i) = y(i) - l(i);
    U(i) = -y(i) + u(i);
end
errorbar(x,y,L,U)
%scatter(x,y,'bo');
hold off


