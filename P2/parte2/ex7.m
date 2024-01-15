% Suponha que o número de mensagens que chega a um servidor de email 
% segue uma lei de Poisson com média de 15 (msg por segundo)

% Calcule a probabilidade de num intervalo de 1 segundo

% a) o servidor nao receber nenhuma mensagem

n = 1;
p = 15;
k = 0;

% Funcao de Poisson
lambda = p*n;
dist_poi = lambda^k * exp(-lambda)/factorial(k);

% b) o servidor receber mais de 10 mensagens

n = 1;
p = 15;
k = 10;

% Probabilidade de receber 10 ou menos msg
x = 0;

for i = 0:k
    lambda = p*n;
    dist_poi = lambda^i * exp(lambda)/factorial(i);

    x = x + dist_poi;
end

soma = sum(x);
% Probabiliade de receber > 10 msg
fprintf("Distribuição Poisson: %f\n", 1-soma);
