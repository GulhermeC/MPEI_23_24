%% Code 1

% Create a matrix with 3 rows and 10000 columns of random values between
% 0.0 and 1.0 (i.e., each column represents a random experiment):
experiencias = rand(3, 10000);

% Create a matrix with 3 rows and 10000 columns with the value 1 if the
% value of the previous matrix is higher than 0.5 (i.e., the result is
% 'head') or with the value 0 otherwise (i.e., the result is 'tail'):
lancamentos = experiencias > 0.5; % 0.5 corresponds to 1 - prob. of 'head'

% Create a row vector with 10000 elements with the sum of the values of
% each columns of the previous matrix (i.e., the number of 'heads' of each
% experiment):
resultados= sum(lancamentos);

% Create a row vector with 10000 elements with the value 1 when the
% previous vector is 2 (i.e., if the number of 'heads' of the experiment is
% 2) or 0 otherwise:
sucessos= resultados==2;

% Compute the final result by dividing the number of experiments with 2
% 'heads' by the total number of experiments:
probSimulacao= sum(sucessos)/10000;



%% Code 1 - second version

N= 1e5;  % number of experiments
p = 0.5; % probability of head
k = 2;   % number of heads
n = 3;   % number of throws

lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N;


