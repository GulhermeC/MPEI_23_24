% Sabendo que um processo de fabrico produz 30% de peças defeituosas e
% considerando a variavel aleatoria X, representativa do numero de pecas
% defeituosas numa amostra de 5 peças tomadas aleatoriamente, obtenha:

% Estimativa para funcao massa de probabilidade de X

E = 1e5;
n = 5;

map = rand(n,E) < 0.3;
total = sum(map);

xi = 1:n;
p = zeros(0,n);

for i = 1:n
    p(i) = sum(total==i)/E;
end

stem(xi,p);

% Grafico representativo da funcao distribuicao acumulada de probabilidades
% de X

dist = cumsum(p);
stairs(xi, dist);

% Estimativa para probabilidade de, no maximo, 2 das peças de uma amostra
% serem defeituosas

total2 = total < 3;

xi2 = 1:n;
p2 = zeros(0,n);
for a = 1:n
    p2(a) = sum(total2==a)/E;
end

prob = sum(p2);
disp(prob);
