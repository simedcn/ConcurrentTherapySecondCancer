
function xprime = sys_ndChemo(t,x,D,OneCycle,TotalDays)

xprime = zeros(2,1);

N = 10^6; %
lambda = 0.40; % Sachs, radiation
r = 0.76; % Sachs, radiation

gamma = 0.19*10^(-9); % fitting parameter

alphad = 0.1333; % Biological data- decay rate
alphaC = 0.2; % Experimental - cell kill ? 

if(t<=TotalDays)    
        chemo = exp(-alphad*mod(t,OneCycle));
        xprime(1) = lambda*x(1)*(1-x(1)) - alphaC*chemo*(D/OneCycle)*x(1) - gamma*(D/OneCycle)*x(1);
        xprime(2) = r*lambda*x(2)*(1-x(1)) - alphaC*chemo*(D/OneCycle)*x(2) + gamma*(D/OneCycle)*N*x(1);
else
    xprime(1) = lambda*x(1)*(1-x(1));
    xprime(2) = r*lambda*x(2)*(1-x(1));
end

