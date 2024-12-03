% MATLAB Script: plot_functions.m
% This script allows the user to select a mathematical function from a list and plots it.

% Clear workspace
clear; clc;

% Define the function list
functions_list = {
    '1/x', @(x) 1./x;
    '1/x^2', @(x) 1./(x.^2);
    '1/(1-x)', @(x) 1./(1-x);
    '1/(1-x^2)', @(x) 1./(1-x.^2);
    'x', @(x) x;
    'x^2', @(x) x.^2;
    'x^3', @(x) x.^3;
    'e^x', @(x) exp(x);
    'a^x (a=2)', @(x) 2.^x;
    'ln(x)', @(x) log(x);
    'log_10(x)', @(x) log10(x);
    'sin(x)', @(x) sin(x);
    'cos(x)', @(x) cos(x);
    'tan(x)', @(x) tan(x);
    'csc(x)', @(x) csc(x);
    'sec(x)', @(x) sec(x);
    'cot(x)', @(x) cot(x);
    'arcsin(x)', @(x) asin(x);
    'arccos(x)', @(x) acos(x);
    'arctan(x)', @(x) atan(x);
    'sinh(x)', @(x) sinh(x);
    'cosh(x)', @(x) cosh(x);
    'tanh(x)', @(x) tanh(x);
    'coth(x)', @(x) coth(x);
    'sech(x)', @(x) sech(x);
    'csch(x)', @(x) csch(x);
    'arsinh(x)', @(x) asinh(x);
    'arcosh(x)', @(x) acosh(x);
    'artanh(x)', @(x) atanh(x);
    '|x|', @(x) abs(x);
    'sign(x)', @(x) sign(x);
    'floor(x)', @(x) floor(x);
    'ceil(x)', @(x) ceil(x);
    'sqrt(x)', @(x) sqrt(x);
    'sqrt[3](x)', @(x) nthroot(x, 3);
    'Gamma(x)', @(x) gamma(x);
    'Riemann zeta(x)', @(x) zeta(x);
    'Li(x) (Logarithmic integral)', @(x) logint(x);
    'sawtooth(x)', @(x) x - floor(x);
};

% Display the menu
fprintf('Select a function to plot from the list below:\n');
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

if x_min >= x_max
    error('Invalid range. Ensure that x_min < x_max.');
end

% Generate x values
x = linspace(x_min, x_max, 1000);

% Handle special cases for functions with restricted domains
try
    y = selected_function(x);
catch
    error('The selected function may not be defined for the given range. Try a different range.');
end

% Plot the function
figure;
plot(x, y, 'LineWidth', 2);
title(['Plot of ', functions_list{choice, 1}]);
xlabel('x');
ylabel('y');
grid on;

% Display message
fprintf('Function "%s" has been plotted.\n', functions_list{choice, 1});