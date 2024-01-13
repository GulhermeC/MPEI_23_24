% a)
% Create a row vector with a sequence of even numbers starting with 4 and
% ending in the number 100

a = 4:2:100;

% b)
% Create a row vector with a decreasing sequence of integers starting at 5
% and ending at -5

b = 5:-1:-5;

% c)
% Create a row vector with a sequence of equally spaced real numbers with
% 100 elements belonging to the range [0 ... 1]

c = linspace(0,1,100);

% d)
% Create a matrix B with random values using command >> B= rand(20,30) 
% (20 rows and 30 columns). Extract to a matrix C the sub-matrix of B
% composed by its rows from 10 to 15 and its columns 9 to 12

matrixB = rand(20,30);
matrixC = matrixB(10:15,9:12);

% e)
% Create a sequence, x, starting with the value -π, ending with the value π
% and with a step of π/15

x = -pi:pi/15:pi;

% f)
% Run the command >> plot (x, sin(4*pi*x). What is the obtained plot?

plot(x, sin(4*pi*x));
