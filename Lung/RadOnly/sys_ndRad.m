% In this code we include logistic growth of normal cells and PM cells
% along with radiation effect from Gibins work.

function xprime = sys_ndRad(t,x,D)

xprime = zeros(2,1);

% Parameters that are fixed

N = 10^6; % Sachs
lambda = 0.40; % Sachs
r = 0.96; % Fitting , sachs

K = 20; % Sachs       
d = D/K; 

tau = 0.02;   % radiation time- 30 minutes = 0.02 days

alpha = 0.18*(d/tau); % Fitting , sachs
gamma = 10^(-6)*(d/tau); % Fitting , sachs

    if(t<=K+tau)
        t-floor(t);
        if (t-floor(t)<=tau)
            t;
            
            xprime(1) = lambda*x(1)*(1-x(1)) - alpha*x(1) - gamma*x(1);
            xprime(2) = r*lambda*x(2)*(1-x(1)) - alpha*x(2) + gamma*N*x(1);
        else

            xprime(1) = lambda*x(1)*(1-x(1));
            xprime(2) = r*lambda*x(2)*(1-x(1));
        end
    else
        
        xprime(1) = lambda*x(1)*(1-x(1));
        xprime(2) = r*lambda*x(2)*(1-x(1));
        
    end










