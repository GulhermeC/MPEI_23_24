%% Code 2 - analytical calculation of the probability in series of Bernoulli experiments
% Parameters defined in question 2

p = 0.5;
k = 2;
n = 3;

prob = nchoosek(n,k)*p^k*(1-p)^(n-k);
% nchoosek(n,k)= n!/(n-k)!/k!