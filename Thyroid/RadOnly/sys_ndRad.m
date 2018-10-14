% In this code we include logistic growth of normal cells and PM cells
% along with radiation effect from Gibins work.

function xprime = sys_ndRad(t,x,D,r)

xprime = zeros(2,1);

% Parameters that are fixed

N = 10^9; % Sachs
lambda = 0.40; %Sachs
r = 0.68; 

K = 20;        
d = D/K;       

tau = 0.02;   % radiation time- 30 minutes = 0.02 days

alpha = 0.25; % Damien Weber et al. 
gamma = 10^(-9); % (d/tau) is the dose rate

    if(t<=K+tau)
        t-floor(t);
        if (t-floor(t)<=tau)
            t;
            
            xprime(1) = lambda*x(1)*(1-x(1)) - alpha*(d/tau)*x(1) - gamma*(d/tau)*x(1);
            xprime(2) = r*lambda*x(2)*(1-x(1)) - alpha*(d/tau)*x(2) + gamma*(d/tau)*N*x(1);
        else

            xprime(1) = lambda*x(1)*(1-x(1));
            xprime(2) = r*lambda*x(2)*(1-x(1));
        end
    else
        
        xprime(1) = lambda*x(1)*(1-x(1));
        xprime(2) = r*lambda*x(2)*(1-x(1));
        
    end










