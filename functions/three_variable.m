% MATLAB Script: plot_3d_shapes_and_curves_smooth.m
% Combines Parametric 3D Curves and Geometric Shape plotting with smooth surfaces.

clear; clc;

% Define the 3D parametric functions
parametric_list = {
    'Helix: [cos(t), sin(t), t]', @(t) [cos(t); sin(t); t];
    'Torus Knot: [cos(2t), sin(3t), cos(5t)]', @(t) [cos(2*t); sin(3*t); cos(5*t)];
    'Lissajous Curve: [sin(3t), cos(5t), sin(7t)]', @(t) [sin(3*t); cos(5*t); sin(7*t)];
    'Spiral: [t*cos(t), t*sin(t), t]', @(t) [t.*cos(t); t.*sin(t); t];
    'Spherical Curve: [sin(t)*cos(2t), sin(t)*sin(2t), cos(t)]', ...
    @(t) [sin(t).*cos(2*t); sin(t).*sin(2*t); cos(t)];
};

% Define 3D geometric shapes
shapes_list = {
    'Cone: Surface of revolution of a line', @(R, H) cone(R, H);
    'Conical Frustum: Truncated cone', @(R1, R2, H) conicalFrustum(R1, R2, H);
    'Cube: Regular 3D box', @(A) cube(A);
    'Cylinder: Uniform circular cross-section', @(R, H) cylinderSurface(R, H);
    'Ellipsoid: Quadric surface', @(A, B, C) ellipsoidSurface(A, B, C);
    'Sphere: Perfectly round surface', @(R) sphereSurface(R);
    'Torus: Donut shape', @(R, r) torusSurface(R, r);
};

% Display the main menu
fprintf('Select the type of 3D plot:\n');
fprintf('1: Parametric 3D Curve\n');
fprintf('2: Geometric Shape\n');
plot_type = input('Enter the number of your choice: ');

switch plot_type
    %% Parametric 3D Curve
    case 1
        fprintf('\nSelect a 3D parametric function to plot:\n');
        for i = 1:size(parametric_list, 1)
            fprintf('%2d: %s\n', i, parametric_list{i, 1});
        end
        choice = input('\nEnter the number of your choice: ');
        if choice < 1 || choice > size(parametric_list, 1)
            error('Invalid selection.');
        end
        selected_function = parametric_list{choice, 2};
        
        % Default parameter range
        t_min = 0; t_max = 4*pi;
        t = linspace(t_min, t_max, 1000); % Finer resolution for smooth curves
        r = selected_function(t);
        x = r(1, :); y = r(2, :); z = r(3, :);
        
        % Plot the curve
        figure;
        plot3(x, y, z, 'LineWidth', 2);
        title(['Parametric 3D Curve: ', parametric_list{choice, 1}]);
        grid on; axis equal;
        xlabel('x'); ylabel('y'); zlabel('z');
        
    %% Geometric Shapes
    case 2
        fprintf('\nSelect a geometric shape to plot:\n');
        for i = 1:size(shapes_list, 1)
            fprintf('%2d: %s\n', i, shapes_list{i, 1});
        end
        choice = input('\nEnter the number of your choice: ');
        if choice < 1 || choice > size(shapes_list, 1)
            error('Invalid selection.');
        end
    
        % Extract the function handle and call it with default parameters
        selected_function = shapes_list{choice, 2};
        switch choice
            case 1, selected_function(1, 2);            % Cone (R=1, H=2)
            case 2, selected_function(1, 0.5, 2);       % Conical Frustum (R1=1, R2=0.5, H=2)
            case 3, selected_function(1);              % Cube (A=1)
            case 4, selected_function(1, 2);           % Cylinder (R=1, H=2)
            case 5, selected_function(1, 1.5, 2);      % Ellipsoid (A=1, B=1.5, C=2)
            case 6, selected_function(1);              % Sphere (R=1)
            case 7, selected_function(1, 0.5);         % Torus (R=1, r=0.5)
        end
        
    otherwise
        error('Invalid plot type selection.');
end

%% Auxiliary Functions for Shapes
function cone(R, H)
    [x, y, z] = cylinder([0 R], 200); % Increased resolution for smooth surface
    z = z * H;
    surf(x, y, z);
    title('Cone');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end

function conicalFrustum(R1, R2, H)
    [x, y, z] = cylinder([R1 R2], 200); % Increased resolution for smooth surface
    z = z * H;
    surf(x, y, z);
    title('Conical Frustum');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end

function cube(A)
    % Define the vertices of the cube
    vertices = [
        0, 0, 0;
        A, 0, 0;
        A, A, 0;
        0, A, 0;
        0, 0, A;
        A, 0, A;
        A, A, A;
        0, A, A
    ];
    
    % Define the faces of the cube
    faces = [
        1, 2, 6, 5;  % Bottom face
        2, 3, 7, 6;  % Right face
        3, 4, 8, 7;  % Top face
        4, 1, 5, 8;  % Left face
        1, 2, 3, 4;  % Front face
        5, 6, 7, 8   % Back face
    ];
    
    % Plot the cube using patch
    figure;
    patch('Vertices', vertices, 'Faces', faces, ...
        'FaceColor', 'cyan', 'EdgeColor', 'black');
    title('Cube');
    xlabel('x'); ylabel('y'); zlabel('z');
    axis equal;
    grid on;
end

function cylinderSurface(R, H)
    [x, y, z] = cylinder(R, 200); % Increased resolution for smooth surface
    z = z * H;
    surf(x, y, z);
    title('Cylinder');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end

function ellipsoidSurface(A, B, C)
    [x, y, z] = ellipsoid(0, 0, 0, A, B, C, 100); % Increased resolution for smooth surface
    surf(x, y, z);
    title('Ellipsoid');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end

function sphereSurface(R)
    [x, y, z] = sphere(100); % Increased resolution for smooth surface
    surf(R*x, R*y, R*z);
    title('Sphere');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end

function torusSurface(R, r)
    [theta, phi] = meshgrid(linspace(0, 2*pi, 100), linspace(0, 2*pi, 100)); % Increased resolution
    x = (R + r * cos(phi)) .* cos(theta);
    y = (R + r * cos(phi)) .* sin(theta);
    z = r * sin(phi);
    surf(x, y, z);
    title('Torus');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % Smooth shading
    grid on; axis equal;
end