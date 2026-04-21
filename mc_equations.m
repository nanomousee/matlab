clc;
clear;
close all;

% Number of random points (Monte Carlo samples)
N = input("Enter number of random points: ");

% Function definition: f(x) = cos(x);
f = @(x) cos(x);

% Limits of integration
a = 0.5;
b = 1;

% Maximum value of function (occurs at x = 0)
% Used to define bounding rectangle for acceptance-rejection
f_max = f(0);

count = 0;  % Counts number of points under the curve

% Pre-allocate arrays for efficiency (avoids resizing in loop)
x_in = zeros(N,1);  y_in = zeros(N,1);
x_out = zeros(N,1); y_out = zeros(N,1);

in_count = 0;
out_count = 0;

% Generating and storing the points
for i = 1:N

    % Generate random point inside rectangle [a,b] x [0,f_max]
    x = a + (b-a)*rand;
    y = f_max * rand;

    % Check if point lies under the curve
    if y <= f(x)
        count = count + 1;

        % Store accepted (inside) points
        in_count = in_count + 1;
        x_in(in_count) = x;
        y_in(in_count) = y;

    else
        % Store rejected (outside) points
        out_count = out_count + 1;
        x_out(out_count) = x;
        y_out(out_count) = y;
    end
end

% Remove unused zero elements
x_in = x_in(1:in_count);
y_in = y_in(1:in_count);

x_out = x_out(1:out_count);
y_out = y_out(1:out_count);

% Monte Carlo estimate using acceptance-rejection formula
% Integral ≈ Area of rectangle × (points under curve / total points)
I_MC = (b - a) * f_max * (count / N);

% Exact value using MATLAB built-in numerical integration
I_exact = integral(f, a, b);

% Relative error calculation
error = abs(I_exact - I_MC)/abs(I_exact);

% Display results (scientific notation for very small values)
fprintf("Monte Carlo Integral = %.10e\n", I_MC);
fprintf("Actual Integral (MATLAB) = %.10e\n", I_exact);
fprintf("Error = %.6f \n", error);

% Plotting
x = linspace(a, b, 1000);   % smooth x values for plotting curve
y = f(x);                   % corresponding function values

% Plot actual function curve
plot(x, y, 'k', 'LineWidth', 2);
hold on;

% Plot accepted points (under curve) in green
scatter(x_in, y_in, 10, 'g', 'filled');

% Plot rejected points (above curve) in red
scatter(x_out, y_out, 10, 'r', 'filled');

xlabel("x");
ylabel("f(x)");
title("Acceptance-Rejection Monte Carlo");

legend("Function", "Accepted Points", "Rejected Points");

grid on;