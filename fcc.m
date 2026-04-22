% FCC Lattice
clc;
clear all;
close all;

a = input('edge lng: ');

% Corner atoms (8 corners)
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

% Face-centered atoms (6 faces)
face_atoms = [
    a/2, a/2, 0;
    a/2, a/2, a;
    a/2, a,   a/2;
    a/2, 0,   a/2;
    0,   a/2, a/2;
    a,   a/2, a/2
];

% Plot corner atoms (red)
scatter3(corner_atoms(:,1), ...
         corner_atoms(:,2), ...
         corner_atoms(:,3), ...
         1000, 'red', 'filled');
hold on;

% Plot face atoms (green)
scatter3(face_atoms(:,1), ...
         face_atoms(:,2), ...
         face_atoms(:,3), ...
         1000, 'green', 'filled');

% Axis settings
xlim([0 a]);
ylim([0 a]);
zlim([0 a]);

xlabel('X');
ylabel('Y');
zlabel('Z');

title('FCC Lattice');
grid on;
axis equal;