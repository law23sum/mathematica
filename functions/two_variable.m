% MATLAB Script: plot_2d_functions.m
% This script allows the user to select a 2D mathematical function from a list and plots it.

% Clear workspace
clear; clc;

% Define the function list
functions_list = {
    'x^2 + y^2', @(x, y) x.^2 + y.^2;
    'sin(x) * cos(y)', @(x, y) sin(x) .* cos(y);
    'e^(x^2 - y^2)', @(x, y) exp(x.^2 - y.^2);
    'x * y', @(x, y) x .* y;
    '1 / (x^2 + y^2 + 1)', @(x, y) 1 ./ (x.^2 + y.^2 + 1);
    'sin(sqrt(x^2 + y^2)) / sqrt(x^2 + y^2)', @(x, y) sin(sqrt(x.^2 + y.^2)) ./ sqrt(x.^2 + y.^2);
    'tan(x) + tan(y)', @(x, y) tan(x) + tan(y);
    'x^2 - y^2', @(x, y) x.^2 - y.^2;
    '|x| + |y|', @(x, y) abs(x) + abs(y);
    'log(x^2 + y^2)', @(x, y) log(x.^2 + y.^2);
    'cos(x^2 - y^2)', @(x, y) cos(x.^2 - y.^2);
    'sinh(x) * cosh(y)', @(x, y) sinh(x) .* cosh(y);
    'sqrt(x^2 + y^2)', @(x, y) sqrt(x.^2 + y.^2);
    '1 / (1 + x^2 + y^2)', @(x, y) 1 ./ (1 + x.^2 + y.^2);
    'exp(-x^2 - y^2)', @(x, y) exp(-x.^2 - y.^2);
};

% Display the menu
fprintf('Select a 2D function to plot from the list below:\n');
for i = 1:size(functions_list, 1)
    fprintf('%2d: %s\n', i, functions_list{i, 1});
end

% Get user selection
choice = input('\nEnter the number of your choice: ');

% Validate user input
if choice < 1 || choice > size(functions_list, 1)
    error('Invalid selection. Please run the script again and select a valid number.');
end

% Get the function handle
selected_function = functions_list{choice, 2};

% Set the range for plotting
x_min = input('Enter the minimum x value for plotting: ');
x_max = input('Enter the maximum x value for plotting: ');
y_min = input('Enter the minimum y value for plotting: ');
y_max = input('Enter the maximum y value for plotting: ');

if x_min >= x_max || y_min >= y_max
    error('Invalid range. Ensure that x_min < x_max and y_min < y_max.');
end

% Generate x and y values
[x, y] = meshgrid(linspace(x_min, x_max, 100), linspace(y_min, y_max, 100));

% Calculate z values
try
    z = selected_function(x, y);
catch
    error('The selected function may not be defined for the given range. Try a different range.');
end

% Plot the function as a surface and contour
figure;
subplot(1, 2, 1);
surf(x, y, z, 'EdgeColor', 'none');
title(['Surface Plot of ', functions_list{choice, 1}]);
xlabel('x'); ylabel('y'); zlabel('z');
grid on; colormap jet;

subplot(1, 2, 2);
contourf(x, y, z, 20);
title(['Contour Plot of ', functions_list{choice, 1}]);
xlabel('x'); ylabel('y');
grid on; colormap jet;

% Display message
fprintf('2D Function "%s" has been plotted.\n', functions_list{choice, 1});