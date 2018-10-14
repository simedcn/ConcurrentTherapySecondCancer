
function xprime = sys_ndChemo(t,x,D,OneCycle,TotalDays)

xprime = zeros(2,1);

N = 10^6;
lambda = 0.40;
r = 0.68;

gamma = 0.9*10^(-7);

alphad = 0.1333;
alphaC = 0.2;

if(t<=TotalDays)
    
        chemo = exp(-alphad*mod(t,OneCycle));
    
        xprime(1) = lambda*x(1)*(1-x(1)) - alphaC*chemo*(D/OneCycle)*x(1) - gamma*(D/OneCycle)*x(1);
        xprime(2) = r*lambda*x(2)*(1-x(1)) - alphaC*chemo*(D/OneCycle)*x(2) + gamma*(D/OneCycle)*N*x(1);   
else
    
    xprime(1) = lambda*x(1)*(1-x(1));
    xprime(2) = r*lambda*x(2)*(1-x(1));
    
end






