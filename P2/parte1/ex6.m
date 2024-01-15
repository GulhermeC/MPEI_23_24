% Considere uma linguagem com apenas 3 palavras {"um", "dois", "tres"} e
% que permite sequencias de 2 palavras. Considere que todas as sequencias
% sao equiprovaveis e que as 2 palavras de uma sequencias podem ser iguais.
% As respostas as questoes seguintes devem ser baseadas nos valores
% teoricos

% a) Qual a probabilidade de sequencia "um dois"

E = 1e5;
t = 2;
f = 3;

map = randi(f,t,E);

prob1 = map(1,:) == 1;
prob2 = map(2,:) == 2;

probMap = sum([prob1;prob2])==2;
prob = sum(probMap)/E;
disp(prob);

% b) Qual a probabilidade de "um" aparecer pelos menos 1 vez numa sequencia

map = randi(f,t,E);

prob = sum(sum(map==1)>=1)/E;
disp(prob);

% c) Qual a probabilidade de ocurrer "um" ou "dois" numa sequencia

mapC = randi(f,t,E);

probC = sum(sum(mapC<3)>=1)/E;
disp(probC);

% d) Qual o valor de P["sequencia incluir a palavra um"|"sequencia inclui
% palavra dois"]?

map = randi(f,t,E);

prob1 = sum(sum(map==2)>=1);
prob2 = sum(sum(map)==3);

probD = prob1/prob2;

disp(probD);