% Temperature Distribution in a Straight Fin using FDM
% Author: Ansh Saxena, Indian Institute of Technology, Patna

% Parameters
L = 4e-2; % Length of the fin (m)
P = 40.4e-2; % Perimeter of the fin (m)
Ac = 4e-4; % Cross section area of the fin (m2)
Tb = (225 + 273); % Base temperature (K)
Ta = (25 + 273); % Ambient temperature (K)
k = 45; % Conductivity of fin material (W/m-K)
h = 15; % Heat transfer coefficient (W/m2-K)

del_x = 0.5e-2; % Distance between two grid points (delta_x)

A = (h*P*(del_x)^2)/(k*Ac);

% Total 9 grid points, including 2 end points

% Equations
% Grid point 2: -(2+A)*T2 + T3 = -A*Ta - Tb
% Grid point 3: T2 -(2+A)*T3 + T4 = -A*Ta
% Grid point 4: T3 -(2+A)*T4 + T5 = -A*Ta
% Grid point 5: T4 -(2+A)*T5 + T6 = -A*Ta
% Grid point 6: T5 -(2+A)*T6 + T7 = -A*Ta
% Grid point 7: T6 -(2+A)*T7 + T8 = -A*Ta
% Grid point 8: T7 -(2+A)*T8 + T9 = -A*Ta
% Grid point 9: 2*T8 -(2+A)*T9 = -A*Ta

% Coefficient Matrix
Mat_A = [-(2+A) 1 0 0 0 0 0 0;
    1 -(2+A) 1 0 0 0 0 0;
    0 1 -(2+A) 1 0 0 0 0;
    0 0 1 -(2+A) 1 0 0 0;
    0 0 0 1 -(2+A) 1 0 0;
    0 0 0 0 1 -(2+A) 1 0;
    0 0 0 0 0 1 -(2+A) 1;
    0 0 0 0 0 0 2 -(2+A)];

% RHS matrix
Mat_B = [-A*Ta-Tb; -A*Ta; -A*Ta; -A*Ta; -A*Ta; -A*Ta; -A*Ta; -A*Ta];

% Solving the equations
T = linsolve(Mat_A, Mat_B)

% Plotting
figure(1);
plot(T);
xlabel("Grid point")
ylabel("Temperature (K)")
title("Temperature Distribution in a Straight Fin")