% Considere o seguinte "jogo": lançamento com os olhos vendados de n
% dardos, um de cada vez, para m alvos, garantindo-se que cada dardo atinge
% sempre um alvo (e apenas 1)

% a) Estime por simulacao a probabilidade de nenhum alvo ter sido atingido
% mais do que uma vez quando n = 20 dardos e m = 100 alvos

E = 1e5;
n = 20;
m = 100;

mx = randi(m,n,E);

dif = zeros(1,E);

for ncol = 1:E
    col = mx(:,ncol);
    dif(ncol) = length(unique(col))==n;
end

a = sum(dif)/E;
disp(a);

% b) Estime por simulacao a probabilidade de pelo menos 1 alvo ter sido
% atingido 2 ou mais vezes quando n = 20 dardos e m = 100 alvos

E = 1e5;
n = 20;
m = 100;

mx = randi(m,n,E);

dif = zeros(1,E);

for ncol = 1:E
    col = mx(:,ncol);
    dif(ncol) = length(unique(col))==n;
end

b = 1 - (sum(dif)/E);
disp(b);

% c) Considere os valores de m = 100 e m = 100000 alvos. Para cada um
% destes valores, faca as simulacoes necessarias para desenhar um grafico
% da probabilidade da alinea em funcao do numero de dardos n. Considere n
% de 10 a 100 com incrementos de 10. Os 2 graficos devem ser sub-graficos
% de uma mesma figura.

E = 1e5;
x = 1:10:100;
m1 = 100;

y1 = zeros(1,10);
for n = 10:10:100
    mx = randi(m1,n,E);
    dif = zeros(1,E);

    for ncol=1:E
        col = mx(:,ncol);
        dif(ncol)=length(unique(col))==n;
    end
    y1(n) = sum(dif)/E;
end
c1 = y1(10:10:end);

m2 = 100000;
for n = 10:10:100
    mx = randi(m2,n,E);
    dif = zeros(1,E);

    for ncol=1:E
        col = mx(:,ncol);
        dif(ncol)=length(unique(col))==n;
    end
    y2(n) = sum(dif)/E;
end

c2 = y2(10:10:end);

plot(x,c1);
plot(x,c2);


% d) Considere o valor de n=100 dardos. Faca as simulacoes necessarias para
% desenhar um grafico da probabilidade da alinha (b) em funcao dos valores
% de m = 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000 alvos

E = 1e5;
x = 1:10:100;

m = [200,500,1000,2000,5000,10000,20000,50000,100000];

for m1 = m
    y1 = zeros(1,10);
    for n = 10:10:100
        mx = randi(m1,n,E);
        dif = zeros(1,E);
        for ncol = 1:E
            col = mx(:,ncol);
            dif(ncol) = length(unique(col))==n;
        end

        y1(n) = sum(dif)/E;
    end

    d = y1(10:10:end);
    plot(x,d);
end