%% Matrices Section
% Demonstrates matrix creation, manipulation, and associated functions.
% Reference: https://www.mathworks.com/help/matlab/matrices-and-arrays.html

%% Basic Matrix Creation
% Initialize matrices with basic MATLAB functions.

a_zerosMatrix = zeros(3, 4);                        % 3x4 matrix of zeros
b_onesMatrix = ones(2, 3);                          % 2x3 matrix of ones
c_randMatrix = rand(2, 2);                          % 2x2 matrix of random values
d_trueMatrix = true(3, 3);                          % 3x3 matrix of logical true
e_falseMatrix = false(2, 4);                        % 2x4 matrix of logical false
f_identityMatrix = eye(3);                          % 3x3 identity matrix
g_diagonalMatrix = diag([1, 2, 3]);                 % Diagonal matrix with values
h_extractDiag = diag(g_diagonalMatrix);             % Extract diagonal from matrix

%% Matrix Concatenation
% Combine matrices row-wise, column-wise, and block-wise.

i_blockDiagMatrix = blkdiag([1, 2; 3, 4], [5, 6; 7, 8]); % Block diagonal matrix
j_rowConcat = cat(1, [1, 2], [3, 4]);                    % Concatenate row-wise
k_colConcat = cat(2, [1; 2], [3; 4]);                    % Concatenate column-wise
l_horzConcat = horzcat([1; 2], [3; 4]);                  % Horizontal concatenation
m_vertConcat = vertcat([1, 2], [3, 4]);                  % Vertical concatenation

%% Matrix Repetition
% Repeat matrices with specific patterns.

n_repeatedElements = repelem([1, 2; 3, 4], 2, 3);        % Repeat elements in array
o_replicatedMatrix = repmat([1, 2; 3, 4], 2, 3);         % Replicate entire matrix

%% Matrix Indexing & Functions
% Access and modify elements, and apply built-in functions.

p_sampleMatrix = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]; % Example matrix
p_element = p_sampleMatrix(4, 2);                             % Access element (row 4, col 2)
p_linearIndex = p_sampleMatrix(8);                            % Access using linear index
p_sampleMatrix(4, 5) = 17;                                    % Add element at new column
p_columnSubset = p_sampleMatrix(1:4, 1);                      % First column, rows 1 to 4
p_specificRow = p_sampleMatrix(3, :);                         % Entire row 3
q_vector = [3 6 9];                                           % Additional vector
q_maxValues = max(p_sampleMatrix);                            % Max values of each column
q_union = union(p_sampleMatrix, q_vector);                    % Union of matrix and vector
[r_minValue, r_maxValue] = bounds(p_sampleMatrix);            % Min and max values in matrix

%% Matrix Properties and Reshaping
% Query properties and reshape matrices.

s_matrixLength = length(p_sampleMatrix);                      % Length of largest dimension
s_matrixSize = size(p_sampleMatrix);                          % Size of the array
s_numDims = ndims(p_sampleMatrix);                            % Number of dimensions
s_numElements = numel(p_sampleMatrix);                        % Total number of elements
s_isMatrix = ismatrix(p_sampleMatrix);                        % Check if input is a matrix
s_reshapeMatrix = reshape(p_sampleMatrix, [], 2);             % Reshape matrix with MATLAB auto-calculating rows
s_squeezeMatrix = squeeze(p_sampleMatrix);                    % Remove singleton dimensions
s_permuteDims = permute(p_sampleMatrix, [2 1]);               % Permute dimensions
s_inversePermute = ipermute(s_permuteDims, [2 1]);            % Inverse permute

%% Matrix Rearrangement
% Rearrange elements with various operations.

t_sortedMatrix = sort(p_sampleMatrix, 2);                     % Sort rows in ascending order
t_sortedRows = sortrows(p_sampleMatrix, 1);                   % Sort rows by first column
t_flipLR = fliplr(p_sampleMatrix);                            % Flip left-to-right
t_flipUD = flipud(p_sampleMatrix);                            % Flip up-to-down
t_rotated90 = rot90(p_sampleMatrix);                          % Rotate 90 degrees
t_transpose = p_sampleMatrix';                                % Transpose
t_complexTranspose = ctranspose(p_sampleMatrix);              % Complex conjugate transpose
t_circularShift = circshift(p_sampleMatrix, [1, -1]);         % Circular shift

%% Advanced Matrix Operations
% Perform mathematical operations on matrices.

u_spaceMatrix = [0 0 0; 1 1 1; 0 0 0];                        % Example matrix
u_matrixAddition = u_spaceMatrix + 10;                        % Add scalar to matrix
u_matrixSin = sin(u_spaceMatrix);                             % Sine operation on matrix
u_matrixMultiplication = u_spaceMatrix * u_spaceMatrix';      % Matrix multiplication

%% Matrix Visualization
% View final matrices to verify.

disp('Basic Matrix Creation and Operations:');
disp(a_zerosMatrix); disp(b_onesMatrix); disp(c_randMatrix);

disp('Concatenated and Repeated Matrices:');
disp(j_rowConcat); disp(k_colConcat); disp(o_replicatedMatrix);

disp('Indexed and Rearranged Matrices:');
disp(t_sortedMatrix); disp(t_flipLR); disp(t_rotated90);

%% Display Variables in a Table
% Helper function to display values for arrays/matrices in a table
formatValue = @(v) formatForTable(v);

% Define a function to format the value for table display
function result = formatForTable(v)
    if ismatrix(v) && ~ischar(v) && ~isstring(v)
        result = mat2str(v); % Convert the matrix to string
    elseif ndims(v) > 2
        result = '3D or higher-dimensional array';
    else
        result = v;
    end
end

% Create a table to consolidate all variables for easy viewing
disp('The Variables & Matrices');
allVariablesTable = table( ...
    ["a_zerosMatrix"; "b_onesMatrix"; "c_randMatrix"; "d_trueMatrix"; "e_falseMatrix"; ...
     "f_identityMatrix"; "g_diagonalMatrix"; "h_extractDiag"; "i_blockDiagMatrix"; ...
     "j_rowConcat"; "k_colConcat"; "l_horzConcat"; "m_vertConcat"; "n_repeatedElements"; ...
     "o_replicatedMatrix"; "p_sampleMatrix"; "p_element"; "p_linearIndex"; "p_columnSubset"; ...
     "p_specificRow"; "q_vector"; "q_maxValues"; "q_union"; "r_minValue"; "r_maxValue"; ...
     "s_matrixLength"; "s_matrixSize"; "s_numDims"; "s_numElements"; "s_isMatrix"; ...
     "s_reshapeMatrix"; "s_squeezeMatrix"; "s_permuteDims"; "s_inversePermute"; ...
     "t_sortedMatrix"; "t_sortedRows"; "t_flipLR"; "t_flipUD"; "t_rotated90"; ...
     "t_transpose"; "t_complexTranspose"; "t_circularShift"; "u_spaceMatrix"; ...
     "u_matrixAddition"; "u_matrixSin"; "u_matrixMultiplication"], ...
    {formatValue(a_zerosMatrix); formatValue(b_onesMatrix); formatValue(c_randMatrix); formatValue(d_trueMatrix); ...
     formatValue(e_falseMatrix); formatValue(f_identityMatrix); formatValue(g_diagonalMatrix); formatValue(h_extractDiag); ...
     formatValue(i_blockDiagMatrix); formatValue(j_rowConcat); formatValue(k_colConcat); formatValue(l_horzConcat); ...
     formatValue(m_vertConcat); formatValue(n_repeatedElements); formatValue(o_replicatedMatrix); ...
     formatValue(p_sampleMatrix); p_element; p_linearIndex; formatValue(p_columnSubset); ...
     formatValue(p_specificRow); formatValue(q_vector); formatValue(q_maxValues); formatValue(q_union); ...
     r_minValue; r_maxValue; s_matrixLength; formatValue(s_matrixSize); s_numDims; ...
     s_numElements; s_isMatrix; formatValue(s_reshapeMatrix); formatValue(s_squeezeMatrix); ...
     formatValue(s_permuteDims); formatValue(s_inversePermute); formatValue(t_sortedMatrix); ...
     formatValue(t_sortedRows); formatValue(t_flipLR); formatValue(t_flipUD); ...
     formatValue(t_rotated90); formatValue(t_transpose); formatValue(t_complexTranspose); ...
     formatValue(t_circularShift); formatValue(u_spaceMatrix); formatValue(u_matrixAddition); ...
     formatValue(u_matrixSin); formatValue(u_matrixMultiplication)}, ...
    'VariableNames', ["Variable", "Value"]);

disp(allVariablesTable);
