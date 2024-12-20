%% Data Types Section
% This section covers data types and their usage.
% Reference: https://www.mathworks.com/help/matlab/data-types.html

%% Variables, Integers, & Strings
% Handling various data types: numbers, strings, and arrays.

a_imaginary = sqrt(-1);                           % Imaginary number
b_complex = [3+4i, 4+3i; -1i, 10i];               % Complex number matrix
c_fahrenheit = 71;                                % Fahrenheit temperature
d_celsius = (c_fahrenheit - 32) / 1.8;            % Conversion to Celsius
e_tempText = "Temperature is " + d_celsius + "C"; % Temperature string concatenation
f_magicMatrix = magic(3);                         % Magic square matrix
g_randArray = rand(3, 5, 2);                      % Random 3D array
h_stringArray = ["a", "bb", "ccc"; "dddd", "eeeeee", "fffffff"]; % String array
h_strLengths = strlength(h_stringArray);          % String lengths per element
i_seq = 'GCTAGAATCC';                             % DNA sequence string
i_seqElement = i_seq(4);                          % Accessing specific element
j_concatSeq = [i_seq 'ATTAGAAACC'];               % Concatenated sequence
k_seriesSum = 1 - 1/2 + 1/3 - 1/4 + 1/5 ...       % Alternating series
             - 1/6 + 1/7 - 1/8 + 1/9;
l_myText = ['Accelerating the pace of ' ...
           'engineering and science'];           % Multi-line string

%% Display Variables in a Table
% Consolidating all variables and results into tables.

% Helper function to display values for arrays/matrices in table
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

% Creating the table with formatted values
disp('The Variables & Values');
resultsTable = table( ...
    ["a_imaginary"; ...
     "b_complex"; ...
     "c_fahrenheit"; ...
     "d_celsius"; ...
     "e_tempText"; ...
     "f_magicMatrix"; ...
     "g_randArray"; ...
     "h_stringArray"; ...
     "h_strLengths"; ...
     "i_seq"; ...
     "i_seqElement"; ...
     "j_concatSeq"; ...
     "k_seriesSum"; ...
     "l_myText"], ...
    {formatValue(a_imaginary); ...
     formatValue(b_complex); ...
     formatValue(c_fahrenheit); ...
     formatValue(d_celsius); ...
     e_tempText; ...
     formatValue(f_magicMatrix); ...
     formatValue(g_randArray); ...
     formatValue(h_stringArray); ...
     formatValue(h_strLengths); ...
     i_seq; ...
     i_seqElement; ...
     j_concatSeq; ...
     formatValue(k_seriesSum); ...
     l_myText}, ...
    'VariableNames', ["Variable", "Value"]);

disp(resultsTable);
