% Considere que uma empresa tem 3 programadores (Andre, Bruno e Carlos) 
% e que a probabilidade de um programa de cada um deles ter problemas (“bugs”) 
% e o numero de programas desenvolvidos assumem os valores apresentados na tabela seguinte

% Programador     Prob(“erro num programa”)     programas
% Andre           0.01                          20 
% Bruno           0.05                          30
% Carlos          0.001                         50

% O Diretor da empresa seleciona de forma aleatoria um dos 100 programas
% produzidos pelos seus 3 programmadores e descobre que este contem um erro
% serio

% a) Qual e a probabilidade de o programa ser do Carlos

% b) De quem e mais provavel ser o programa

E = 1e5;
T = 100;

progA = 20;
progB = 30;
progC = 50;

eA = 0.01;
eB = 0.05;
eC = 0.001;

probA = rand(progA,E) < eA;
probB = rand(progB,E) < eB;
probC = rand(progC,E) < eC;

all = [probA;probB;probC];
disp(all);

errorA = 0;
errorB = 0;
errorC = 0;
totalerr = 0;

for pha = 1:E
    i = randi(100);

    if all(i,pha) == true
        totalerr = totalerr + 1;
        if i > 50
            errorC = errocC + 1;
        elseif i > 20
            errorB = errorB + 1;
        else
            errorA = errorA + 1;
        end
    end
end

errProbA = errorA/totalerr;
errProbB = errorB/totalerr;
errProbC = errorC/totalerr;

fprintf('prob Error A: ');
display(errProbA);


fprintf('prob Error B: ');
display(errProbB);


fprintf('prob Error C: ');
display(errProbC);