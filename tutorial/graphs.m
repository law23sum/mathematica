%% Combined Graph Section
% Demonstrates various 2D plots, customizations, and specialized charts.
% Reference: https://www.mathworks.com/help/matlab/graphics.html?s_tid=CRUX_lftnav

% Initialize variables for plots
x1 = linspace(0, 2*pi, 50);              % x for trigonometric functions
y_sin = sin(x1);                         % y for sine
y_cos = cos(x1);                         % y for cosine

x2 = linspace(0, 10, 1000);              % x for exponential sine
y_exp_sin = exp(x2/10) .* sin(4*x2);     % y for exponential sine

x3 = 1:100;                              % x for random points
y_rand = rand(100, 1);                   % y for random data
idx_max = find(y_rand == max(y_rand));   % Index of max
idx_min = find(y_rand == min(y_rand));   % Index of min

x4 = 0:0.2:10;                           % x for Bessel function
y_bessel = besselj(0, x4);               % y for Bessel function
xconf = [x4 x4(end:-1:1)];               % x for confidence bounds
yconf = [y_bessel + 0.15, y_bessel(end:-1:1) - 0.15]; % y for confidence bounds

x5 = linspace(0, 25);                    % x for multiple sine and exponential plots
y1 = sin(x5 / 4);                        % Sine wave 1
y2 = sin(x5 / 5);                        % Sine wave 2
y3 = sin(x5 / 6);                        % Sine wave 3
r1 = exp(x5 / 6);                        % Exponential 1
r2 = exp(x5 / 8);                        % Exponential 2

x = 1:50;                                % x for scatter plots with fit lines
meas1 = 0.25*x + randn(1,50);            % First measurement data
meas2 = 0.5*x + randn(1,50) + 5;         % Second measurement data
p1 = polyfit(x, meas1, 1);               % Fit line for meas1
y1_fit = polyval(p1, x);                 % Evaluate fit line for meas1
p2 = polyfit(x, meas2, 1);               % Fit line for meas2
y2_fit = polyval(p2, x);                 % Evaluate fit line for meas2

%% Create Subplots
figure;
tiledlayout(4, 2, 'TileSpacing', 'compact', 'Padding', 'compact');

% 1. Trigonometric Functions (Sine and Cosine)
nexttile;
plot(x1, y_sin, ':', 'LineWidth', 1.5);
hold on;
plot(x1, y_cos, '--ro', 'LineWidth', 1.5);
hold off;
title('Sine and Cosine Functions');
xlabel('x');
ylabel('y');
legend('sin(x)', 'cos(x)', 'Location', 'best');
grid on;

% 2. Exponential Sine
nexttile;
plot(x2, y_exp_sin, '-*', 'MarkerIndices', 1:10:length(y_exp_sin), 'LineWidth', 1);
title('Exponential Sine Function');
xlabel('x');
ylabel('exp(x/10) * sin(4x)');
grid on;

% 3. Random Points with Min and Max Markers
nexttile;
plot(x3, y_rand, '-p', 'MarkerIndices', [idx_max, idx_min], ...
    'MarkerFaceColor', 'red', 'MarkerSize', 15, 'LineWidth', 1);
title('Random Data with Min and Max Markers');
xlabel('x');
ylabel('Random Value');
grid on;

% 4. Bessel Function with Confidence Bounds
nexttile;
fill(xconf, yconf, 'red', 'FaceColor', [1, 0.8, 0.8], 'EdgeColor', 'none');
hold on;
plot(x4, y_bessel, 'ro', 'LineWidth', 1.5);
hold off;
title('Bessel Function with Confidence Bounds');
xlabel('x');
ylabel('Bessel J_0(x)');
grid on;

% 5. Multiple Sine Waves
nexttile;
plot(x5, y1, 'b', x5, y2, 'g', x5, y3, 'm', 'LineWidth', 1.5);
title('Multiple Sine Waves');
xlabel('x');
ylabel('y');
legend('sin(x/4)', 'sin(x/5)', 'sin(x/6)', 'Location', 'best');
grid on;

% 6. Multiple Sine and Exponential Waves with Right y-Axis
nexttile;
yyaxis left;
plot(x5, y1, 'b', x5, y2, 'g', x5, y3, 'm', 'LineWidth', 1.5);
ylabel('Sine Waves');

yyaxis right;
plot(x5, r1, '--r', x5, r2, '--k', 'LineWidth', 1.5);
ylabel('Exponential Waves');

title('Sine and Exponential Waves');
xlabel('x');
legend('sin(x/4)', 'sin(x/5)', 'sin(x/6)', 'exp(x/6)', 'exp(x/8)', 'Location', 'best');
grid on;

% 7. Scatter Plot with Fit Lines (Measurement 1 and 2)
nexttile([1 2]); % Larger subplot spanning two columns
scatter(x, meas1, 'filled');
hold on;
scatter(x, meas2, 'filled');
plot(x, y1_fit, 'LineWidth', 1.5);
plot(x, y2_fit, 'LineWidth', 1.5);
title('Scatter Plots with Fit Lines');
xlabel('x');
ylabel('Measurements');
legend('Measurement 1', 'Measurement 2', 'Fit Line 1', 'Fit Line 2', 'Location', 'best');
grid on;
hold off;
colororder([0.5 0.25 0.90; 0.10 0.65 0.25]); % Custom color order

%% Complex Number Plotting with Subplots Including 3D Representation
% This script plots complex numbers both on a 2D complex plane, in polar coordinates,
% and adds a 3D plot to visualize the progression of complex numbers in 3D space.

% Define a parameterized complex function
t = linspace(0, 4*pi, 200);
z = t .* exp(1i * t); % Define the complex numbers using parameter 't'

% Create a new figure
figure;

% Subplot 1: Complex Plane Plot (Cartesian Coordinates)
subplot(2, 2, 1);                       % Create first subplot (2 rows, 2 columns, 1st plot)
plot(real(z), imag(z), '-o');           % Plot real part vs. imaginary part
axis equal;                             % Set equal axis ratio for proper scaling
grid on;                                % Display grid
xlabel("Re(z)");                        % Label x-axis as Real part
ylabel("Im(z)");                        % Label y-axis as Imaginary part
title("Complex Plane Plot");

% Subplot 2: Polar Plot of Parameterized Complex Function
subplot(2, 2, 2);                       % Create second subplot (2 rows, 2 columns, 2nd plot)
polarplot(z, '-');                      % Plot in polar coordinates (magnitude vs. angle)
title("Polar Plot");

% Subplot 3: 3D Plot of Complex Numbers
subplot(2, 2, [3 4]);                   % Create third subplot (spans 2 columns)
plot3(real(z), imag(z), t, '-o');       % Plot real vs. imaginary vs. t in 3D
grid on;                                % Display grid
xlabel("Re(z)");                        % Label x-axis as Real part
ylabel("Im(z)");                        % Label y-axis as Imaginary part
zlabel("t");                            % Label z-axis as parameter t
title("3D Plot of Complex Numbers");
view(45, 30);                           % Set the view angle for better visualization

% General Title for the Figure
sgtitle('Complex Number Visualization in Cartesian, Polar, and 3D Plots');




