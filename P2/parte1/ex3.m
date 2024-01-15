% Considere um array de tamanho T que serve de base à implementação de uma
% memoria associativa (por exemplo). Assuma que a funcao de hash devolve um
% valor entre 0 e T-1 com todos os valores igualmente provaveis

% a) Determine por simulacao a probabilidade de haver pelo menos uma
% colisao (pelo menos 2 keys mapeadas pela funcao de hash para a mesma posicao do array) 
% se forem introduzidas 10 keys num array de tamanho T = 1000

E = 1e4;
T = 1000;
k = 10;

map = randi(T,k,E);

proc = 0;
for i = 1:E
    col = map(:,i);
    aux = unique(col);
    if length(aux) < k
        proc = proc + 1;
    end
end

a = proc/E;

% b) Faca um grafico da probabilidade da alinea (a) em funcao do numero de
% keys para todos os valores relevantes num array de tamanha T = 1000

E = 1e4;
T = 1000;
k = 1:1:1000;
num = zeros (1,1000);

for k1 = k
    map = randi(T,k1,E);

    proc = 0;
    for i = 1:E
        col = map(:,i);
        aux = unique(col);
        if length(aux) < k1
            proc = proc + 1;
        end
    end

    prob = proc/E;
    num(k1) = prob;
end

plot(k, num);

% c) Para um numero de keys igual a 50, represente graficamente a variacao
% da probabilidade (estimada por simulacao) de nao haver nenhuma colisao em
% funcao do tamanha T do array (assuma os tamanhos de 100 ate 1000 com
% incrementos de 100)

E = 1e4;
T = 100:100:1000;
k = 50;
num = zeros(1,10);

for t1 = T
    map = randi(t1,k,E);

    proc = 0;
    for i = 1:E
        col = map(:,a);
        aux = unique(col);

        if length(aux) < k
            proc = proc + 1;
        end
    end

    prob = 1-(proc/E);
    num(t1/100) = prob;
end

disp(num);
plot(T,num);