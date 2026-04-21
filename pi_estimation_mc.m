clc;        % Clear command window
clear;      % Clear variables
close all;  % Close figures

% Number of simulations
N_values = [100, 1000, 100000];

% Actual value of pi
pi_actual = pi;

for k = 1:length(N_values)

    N = N_values(k);   % current number of random points

    inside = 0;        % counter for points inside circle

    for i = 1:N

        % Generate random point between -1 and 1
        x = 2*rand - 1;
        y = 2*rand - 1;

        % Check if point lies inside circle
        if (x^2 + y^2) <= 1
            inside = inside + 1;
        end

    end

    % Estimate value of pi
    pi_calc = 4 * (inside / N);

    % Calculate error
    error = abs(pi_actual - pi_calc);

    % Display results
    fprintf("For N = %d\n", N);
    fprintf("Calculated pi = %.6f\n", pi_calc);
    fprintf("Error = %.6f\n\n", error);

end