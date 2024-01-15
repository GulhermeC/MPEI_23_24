% Considere uma festa em que esta presente um determinado numero n de
% pessoas

% a) Qual deve ser o menor valor de n para o qual a probabilidade de 2 ou
% mais pessoas terem a mesma data de aniversario (mes e dia) e superior a
% 0.5 (assuma que um ano tem sempre 365 dias)

y = 365;
E = 1e4;

dif = zeros (1,100);

for i = 1:100
    mx = randi(y,i,E);

    dif1=zeros(1,E);

    for ii=1:E
        col = mx(:,ii);
        dif1(ii) = length(unique(col))==i;
    end
    dif(i) = sum(dif1/E);
end

num = find(dif<0.5,1);
disp(num);

% b) Qual deve ser o valor de n para que a probabilidade passe a ser
% superior a 0.9

y = 365;
E = 1e4;

dif = zeros (1,100);

for i = 1:100
    mx = randi(y,i,E);

    dif1=zeros(1,E);

    for ii=1:E
        col = mx(:,ii);
        dif1(ii) = length(unique(col))==i;
    end
    dif(i) = sum(dif1/E);
end

num = find(dif<0.1,1);
disp(num);