clc;        % Clear the command window
clear;      % Clear all variables from workspace
close all   % Close all currently open figure windows

% Input parameters

% Number of particles
N = input('Enter number of atoms: ');

% Total steps
steps = input("Enter number of simulation steps: ");

% Box size
box_size = input("Enter the size of box: ");

% Time step
dt = input("Enter time step (dt): ");

% Initial positions (random inside box)
pos = rand(N,2) * box_size;

% Initial velocities (random, normal distribution)
vel = randn(N,2);

% Previous positions (needed for Verlet method)
pos_old = pos - vel * dt;

% Lennard-Jones parameters
epsilon = 1;
sigma = 1;

% Lennard-Jones force function
force = @(r) 24*epsilon*((2*(sigma^12)./(r.^13)) - ((sigma^6)./(r.^7)));

for step = 1:steps

    % Wait for user to press Enter (For atoms to update after Keystroke)
    input("Press Enter to continue...");

    % Initialize forces on all particles
    forces = zeros(N,2);

    % Calculate forces between all pairs of particles
    for i = 1:N
        for j = i+1:N

            r_ij = pos(j,:) - pos(i,:);   % distance vector
            r = norm(r_ij);               % distance magnitude

            if r > 1e-5   % avoid division by zero

                unit_vec = r_ij / r;   % direction of force
                f = force(r);          % Lennard-Jones force

                % Apply equal and opposite forces
                forces(i,:) = forces(i,:) - f * unit_vec;
                forces(j,:) = forces(j,:) + f * unit_vec;

            end
        end
    end

    % Update position using Verlet formula
    pos_new = 2*pos - pos_old + forces * dt^2;

    % Keep particles inside box (periodic boundary)
    pos_new = mod(pos_new, box_size);

    % Estimate velocity
    vel_new = (pos_new - pos_old) / (2*dt);

    % Update variables for next step
    pos_old = pos;
    pos = pos_new;
    vel = vel_new;

    % Plot particles as blue filled circles
    plot(pos(:,1), pos(:,2), 'bo', 'MarkerFaceColor', 'b');
    xlim([0 box_size]);
    ylim([0 box_size]);

    xlabel("X-Position");
    ylabel("Y-Position");
    title(['2D MD Simulation, Step = ', num2str(step)]);

    drawnow;   % forces MATLAB to immediately update the figure window
    %pause(0.05); % slows animation

end