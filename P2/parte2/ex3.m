% Considere 4 lancamentos de uma moeda equilibrada. Seja X a variavel
% aleatoria representativa do numero de coroas observadas nos 4 lançamentos

E = 1e5;
n = 4;

map = randn(n,E) < 0.5;
tot = sum(map);

xi = 1:n;
p = zeros(0,4);

for i = 1:n
    p(i) = sum(tot==i)/E;
end


% a) Estime por simulacao a funcao massa de probabilidade px (x) da variavel X

stem(xi,p);

% b) Estime o valor esperado, a variancia e o desvio padrao de X com base
% em px(x)
vlr_esperado = xi * p.';
fprintf("Valor esperado: %f", vlr_esperado);


% Variancia
var = xi.^2 * p.' - vlr_esperado^2;
fprintf("Variância: %f", var);

% Desvio padrao
desvio = sqrt(var);
fprintf("Desvio padrão: %f", desvio);

% c) Identifique o tipo da distribuicao da variavel aleatoria X e escreva a
% expressao teorica da respetiva funcao de probabilidade

% Tipo de Distribuição = Binomeal
% E[x] = n*p