% Temperature Distribution in a Straight Fin using FDM
% Ansh Saxena, Indian Institute of Technology, Patna

n = 25; % Number of Grid Points
% Minimum number of grid points should be 3

% Parameters
L = 4e-2; % Length of the fin (m)
P = 40.4e-2; % Perimeter of the fin (m)
Ac = 4e-4; % Cross section area of the fin (m2)
Tb = (225 + 273); % Base temperature (K)
Ta = (25 + 273); % Ambient temperature (K)
k = 45; % Conductivity of fin material (W/m-K)
h = 15; % Heat transfer coefficient (W/m2-K)

del_x = L/(n-1);
x = linspace(0, L*100, n);
A = (h*P*(del_x)^2)/(k*Ac);

% Initializing Coefficient Matrix
Mat_A = zeros(n-1);

% Creating RHS Matrix
Mat_B = (-A*Ta)*ones(1, n-1);
Mat_B(1, 1) = (-A*Ta-Tb);

% Formulating equation matrix
Mat_A(1, 1) = -(2+A);
Mat_A(2, 1) = 1;
Mat_A(n-1, n-1) = -(2+A);
Mat_A(n-2, n-1) = 2;
for j=1:1:n-1
    for i=1:1:n-1
        if i == j && i <= n-2 && i >= 2
            Mat_A(i, j) = -(2+A);
            Mat_A(i+1, j) = 1;
            Mat_A(i-1, j) = 1;
        end
    end
end

% Solving the Equations
Mat_Temp = linsolve(Mat_A', Mat_B');

% Temperature Values
T = zeros(1, n);
T(1, 1) = Tb;

for i=2:1:n
    T(1, i) = Mat_Temp(i-1, 1);
end

% Plotting the Temperature Distribution
figure(1)
plot(x, T, 'r-', 'LineWidth', 3, 'MarkerSize', 2);
xlabel('Length (cm)');
ylabel('Temperature (K)');
title('Temperature Distribution in a Straight Fin');