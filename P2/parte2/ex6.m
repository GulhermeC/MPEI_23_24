% Distribuicao de Poisson é uma forma limite da distribuicao (quando n -> ∞, 
% p -> 0 e np permanece constante) e portanto pode ser usada para aproximar
% e simplificar os calculos envolvidos com a binomial em situacoes em que
% as condicoes anteriores se verifiquem

% Num processo industrial de fabrico de chips alguns aparecem defeituosos
% tornando-os inapropriados para comercializacao. E sabido que em media por
% cada 1000 chips ha 1 defeituoso

% Usando distribuicao binomial, determine a probabilidade de numa amostra
% de 8000 chips aparecerem 7 defeituosos

n = 8000;
p = 1/1000;

k = 7;

% Funcao Binomial
comb = nchoosek(n,k);
a = comb * p^k;
dist_bin = a * (1-p)^(n-k);

% Determine a mesma probabilidade usando a aproximcao de Poisson e compare
% o resultado com a alinea anterior

% funcao Poisson
lambda = p*e;
dist_poi = lambda^k * exp(-lambda)/factorial(k);