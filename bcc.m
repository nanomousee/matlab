
% BCC_Lattice
clc; clear all;

a = input('edge lng: ');

% Corner atoms (same as FCC)
corner_atoms = [
    0, 0, 0;
    a, 0, 0;
    a, a, 0;
    0, a, 0;
    0, 0, a;
    a, 0, a;
    a, a, a;
    0, a, a
];

% Body center atom
body_atom = [
    a/2, a/2, a/2
];

% Plot corner atoms (red)
scatter3(corner_atoms(:,1), ...
         corner_atoms(:,2), ...
         corner_atoms(:,3), 1000, 'red', 'filled');
hold on

% Plot body center atom (blue)
scatter3(body_atom(:,1), ...
         body_atom(:,2), ...
         body_atom(:,3), 1000, 'blue', 'filled');

% Box limits
xlim([0 a])
ylim([0 a])
zlim([0 a])
legend('corner atoms','body atoms')
title('BCC Lattice')
grid on
axis equal