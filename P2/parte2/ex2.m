% Considere uma caixa contendo 90 notas de 5 euros, 9 notas de 50 e 1 de
% 100

% a) Descreva o espaço de amostragem da experiencia aleatoria, retirar uma
% nota da caixa e as probabilidades dos acontecimentos elementares

% Espaco amostragem
amos = 1:100;

% Conteudo do caixa
n5 = 90;
n50 = 9;
n100 = 1;
notas = n5 + n50 + n100;

% Probabilidades
p5 = n5/notas;
p50 = n50/notas;
p100 = n100/notas;

% b) Considere aogra a variavel aleatoria X como sendo o valor de uma nota
% retirada a sorta da caixa acima descrita. Descreva o espaço de amostragem
% e a funcao massa de probabilidade de X

xi = [5, 50, 100];
p = [0.9, 0.01, 0.09];

stem(xi,p);

% c) Determine a função distribuida acumulada de X e efetue a sua
% representacao grafica

dist = cumsum(p);

stairs(xi, dist);