clc;        % Clear the command window
clear;      % Clear all variables from workspace
close all   % Close all currently open figure windows

% Generating a Body Centered Cubic (BCC) Bravais Lattice

% Ask user for Lattice Parameter (edge length)
a = input("Enter the edge length: ");

% Define the coordinates for the BCC lattice points
x = [a a 0 a 0 a 0 0];
y = [0 a a a a 0 0 0];
z = [0 0 a a 0 a 0 a];

% Define the coordinates for the Body Centered Atom
xc = a/2;
yc = a/2;
zc = a/2;

% Plot CORNER atoms: large blue filled circles
scatter3(x, y, z, 1000, 'blue', 'filled');

hold on; % Allow multiple plot commands on the same figure

% Plot BODY CENTER atom: large red filled circle
scatter3(xc, yc, zc, 1500, 'red', 'filled');