% Temperature Distribution in a Straight Fin using Analytical Method

% Parameters
L = 4e-2; % Length of the fin (m)
P = 40.4e-2; % Perimeter of the fin (m)
Ac = 4e-4; % Cross section area of the fin (m2)
Tb = (225 + 273); % Base temperature (K)
Ta = (25 + 273); % Ambient temperature (K)
k = 45; % Conductivity of fin material (W/m-K)
h = 15; % Heat transfer coefficient (W/m2-K)

del_x = 0.5e-2; % Distance between two grid points (delta_x)
m = sqrt(h*P/(k*Ac));

T = []; % Temperature array

for x=0:1:8
    T(x+1) = (Tb-Ta)*(cosh(m*(L-(x*del_x)))/cosh(m*L)) + Ta;
end