% This code is for implementing RT 
% Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

% This code is for Radiation Therapy

t_final = 40;
D = 0:1:60;
t = 1:0.01:t_final;
%A = dlmread('ThyroidDataHL.txt','\t');
%D = A(:,1);

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRad,t,[1;0],D(i)); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_thyroid(i) = x(end,2*i);  %  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

figure(1)
hold on
%plot(D,ERR_thyroid)

plot(D,PMCells_after_Saturation)

%------- Thyroid ERR data due to HL from Shuryak--------% 

A = dlmread('ThyroidDataHL.txt','\t');

x = A(:,1);
y = A(:,2);

M = dlmread('ThyroidErrorBars.txt','\t');

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
errorbar(x,y,U,L)
%scatter(x,y,'bo');
hold off



%Y1 = PMCells_after_Saturation;
%Y2 = A(:,2)';
%E = (Y1-Y2).^2;
%E1 = sum(E)/length(Y1)
