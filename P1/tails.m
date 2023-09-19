function [outputArg1] = tails(p, n, k, N)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% p = probabilidade de cara
% n = número de lançamentos
% k = número de caras
% N = número de experiências

lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos)==k;
prob = sum(sucessos)/N;

outputArg1 = prob;

end