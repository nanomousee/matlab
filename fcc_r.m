%FCC_Lattice
clc; clear all

a = input('edge lng: ');

%Corner atoms
corner_atoms = [
    0, 0, 0;
    a, 0, 0;
    a, a, 0;
    0, a, 0;
    0, 0, a;
    a, 0, a;
    a, a, a;
    0, a, a;
];

%Face atoms
face_atoms = [
    a/2, a/2, 0;
    a/2, a/2, a;
    a/2, a, a/2;
    a/2, 0, a/2;
    0, a/2, a/2;
    a, a/2, a/2;
];

scatter3(corner_atoms(:,1), ...
         corner_atoms(:,2), ...
         corner_atoms(:,3), 1000, 'red', 'filled');

hold on

scatter3(face_atoms(:,1), ...
         face_atoms(:,2), ...
         face_atoms(:,3), 1000, 'green', 'filled');