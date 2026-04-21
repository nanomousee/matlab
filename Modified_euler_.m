clc;    % Clear the command window
clear;  % Clear all variables from workspace

% Estimating Solution of a Differential Equation
% Using MODIFIED EULER'S METHOD in MATLAB

% Defining the given function f(x, y) = y - 2x^2 + 1
f = @(x, y) y - (2 * (x^2)) + 1;

% ---------------- Input of Initial Parameters ----------------
x  = input("Enter Initial Value of x  : ");   % Starting x value
y  = input("Enter Initial Value of y  : ");   % Starting y value (boundary condition)
h  = input("Enter Step Size h         : ");   % Step size
x_n = input("Enter Final value of x   : ");   % Final x value

% Initializing Empty Matrices
x_value        = [];  % Stores x values
y_value        = [];  % Stores y values
fxy_value      = [];  % Stores f(xi, yi)
y_P_value      = [];  % Predictor values 
fxy_new_value  = [];  % f(xi+1, yP)
y_C_value      = [];  % Corrector values

% LOOP
while (x_n >= x)

    % Step 1: Evaluate f(xi, yi)
    fxy = f(x, y);

    % Step 2: Predictor
    y_P = y + (h) * fxy;

    % Step 3: Move x forward
    x_new = x + h;

    % Step 4: Evaluate at predicted point
    fxy_new = f(x_new, y_P);

    % Step 5: Corrector
    y_C = y + (h / 2) * (fxy + fxy_new);

    % Store values
    x_value       = [x_value; x];
    y_value       = [y_value; y];
    fxy_value     = [fxy_value; fxy];
    y_P_value     = [y_P_value; y_P];
    fxy_new_value = [fxy_new_value; fxy_new];
    y_C_value     = [y_C_value; y_C];

    % Update for next step
    x = x_new;
    y = y_C;

end

% Create result table
result_table = table(x_value, y_value, fxy_value, y_P_value, fxy_new_value, y_C_value, ...
    'VariableNames', {'x', 'y', 'f(xi,yi)', 'y_P(i+1)', 'f(xi+1,yP)', 'y_C(i+1)'});

disp(result_table);

% Final answer
fprintf('\nFinal Value of y at x = %.1f is : %.5f\n', x_n, y);