% Considere a variavel aleatoria X corresponde a face que fica para cima no
% lancamento de 1 dado

% Casos possiveis
xi = 1:6;

% Probabilidade de cada
one = ones(1,6);

p = one/6;
disp(p);

% a) Funcao massa de probabilidade de x

stem(xi,p);

% b)

dist = cumsum(p);
disp(dist);
stairs(xi,dist);