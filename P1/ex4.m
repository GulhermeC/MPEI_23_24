% What is the probability of getting at least 6 heads on 15 throws of
% balanced coin?

N= 1e5;
p = 0.5;
k = 6;
n = 15;

lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)>=k;
probSimulacao= sum(sucessos)/N;