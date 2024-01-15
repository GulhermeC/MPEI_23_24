% Considere um dado de 6 faces numeradas de 1 a 6 lancado 2 vezes. Assuma
% que o dado e equilibrado (mesma probabilidade para todas as faces ficarem
% para cima). Considere os acontecimentos seguintes: A - a soma dos 2
% valores e igual a 9, B - o segundo valor e par, C - pelos menos 1 dos
% valores e igual a 5 e D - nenhum dos valores e igual a 1

% a) Estime por simulacao a probabilidade de cada um dos acontecimentos

E = 1e5;
pos = 6;
f = 2;

map = randi(pos, f, E);

% A - soma dos 2 valores e igual a 9
probA = sum(sum(map) == 9) / E;
fprintf('Probabilidade A: ');
disp(probA);

% B - o segundo valor e par
mapB = map(2,:);
mapPar = rem(mapB,2) == 0;
probB = sum(mapPar)/E;

fprintf('Probabilidade B: ');
disp(probB);

% C - pelo menos 1 dos valores e igual a 5
probC = sum(sum(map == 5)>=1)/E;
fprintf('Probabilidade C: ');
disp(probC);


% D - nenhum dos valores e igual a 1
probD = sum(sum(map == 1)==0)/E;
fprintf('Probabilidade D: ');
disp(probD);

% b) Determines teoricamente se os acontecimentos A e B sao independentes
A1 = sum(map) == 9;
B1 = rem(map(2,:),2) == 0;
lst = [A1;B1];
AB = sum(sum(lst) == 2)/E;
fprintf('AB: ');
disp(AB);

%Teoricamente P(A^B) = P(A) * P(B)
fprintf('A * B: ');
disp(probA * probB);

% c) Determine teoricamente se os acontecimentos C e D sao independentes
C1 = sum(map == 5)>=1;
D1 = sum(map == 1)== 0;
lst1 = [C1; D1];
CD = sum(sum(lst1) == 2)/E;
fprintf('CD: ');
disp(CD);
%Teoricamente P(C^D) = P(C) * P(D)
fprintf('C * D: ');
disp(probC * probD);