
A = dlmread('RRBleomycinVeiga100.txt','\t');

x = A(:,1);
y = A(:,2);

M = dlmread('ErrorBarsBleomycinVeiga100.txt','\t');

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
figure(1)
hold on
errorbar(x,y,U,L)
%scatter(x,y,'bo');
plot([0 10 20], [1.5648 1.004 0.001])
hold off
