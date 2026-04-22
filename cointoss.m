% Monte Carlo simulation for coin toss

clc;              % Clear command window
clear all;        % Remove all variables from workspace

% Take input: number of simulations
n = input("enter no of simulations: ");

count = 0;        % Counts favorable outcomes

% Loop over number of simulations
for i = 1:n
    
    h = 0;        % Number of heads in one experiment
    
    % Simulate 10 coin tosses (random numbers between 0 and 1)
    toss = rand(1,10);
    
    % Loop through each toss
    for j = 1:10
        
        % If random number > 0.5 → consider it as HEAD
        if (toss(1,j) > 0.5)
            h = h + 1;   % Increase head count
        end
        
    end
    
    % Check required condition:
    % number of heads = 3 or 6 or 9
    if (h == 3 || h == 6 || h == 9)
        count = count + 1;   % Favorable case
    end
    
end

% Probability = favorable outcomes / total simulations
prob = count / n;

% Display result
disp(prob)