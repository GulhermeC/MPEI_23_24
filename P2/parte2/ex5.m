% Suponha que os motores de um podem falhar com probabilidade p e que as
% falhas são independentes entre motores. Suponha ainda que o aviao se
% despenha se mais de metade dos motores falharem. Nestas condicoes,
% prefere voar num motor com 2 ou 4 motores


E = 1e5;

k = 2;

r = 0;
i = 1;

for p = 0:0.005:0.5
    comb = nchoosek(E,k);
    a = comb * p^k;
    r(i) = a*(1-p)^(e-k);

    i = i+1; 
end