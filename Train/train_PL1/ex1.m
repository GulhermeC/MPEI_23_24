clc;

% Suponha que o gerador de palavras aleatorias e baseado na cadeia de 
% Markov representada pelo seguinte diagrama de transiçao de estados, 
% onde a probabilidade de transição de cada
% estado e a mesma para todos os estados possıveis seguintes 
% (o estado  "." indica que a letra anterior é a ultima letra da palavra)
% e a probabilidade da primeira letra e a mesma para todas as letras

%a) Defina, no Matlab, a matriz de transiçao de estados T 
%   e simule a geraçao de uma palavra aleatoria

    %r   %o   %m   %a  %.
T = [0   1/3  0    1/4  0
     .5  0    0.5  1/4  0
     0   1/3  0    1/4  0
     .5  0    0.5  0    0
     0   1/3  0    1/4  0];

word = generateWord(T);
fprintf("A palavra random gerada foi: %s.\n", word);


%b) Simule a geracao de 10^5 palavras aleatorias para estimar a lista de 
%   palavras geradas e a probabilidade de cada palavra. 
%   Quantas palavras diferentes foram geradas? 
%   Apresente as 5 palavras com as probabilidades estimadas mais altas 
%   e respectivos valores de probabilidade

N = 1e5;
lista= {};
contadores = {1};
lista{1} = generateWord(T);

% Preencher cell array da lista de palavras unicas e cell array de
% contadores
for i = 2 : N
    word = generateWord(T);
    a = ismember(lista, word);
    pos = find(a == true);
    if (isempty(pos))
        lista{end+1} = word;
        contadores{end+1} = 1;
    else
        contadores{pos} = contadores{pos} + 1;
    end
end

% Preencher cell array com probabilidades
probabilidades = {1, length(contadores)};
for i = 1 : length(contadores)
    probabilidades{i} = contadores{i} / N;  
    %Contem as probabilidades de cada palavra gerada
end

fprintf("Foram geradas %d palavras diferentes.\n",length(lista));
[p, idx] = sort(cell2mat(probabilidades), 'descend');
for i = 1 : 5
    fprintf("A %dª maior probabilidade é de %s = %.4f.\n", i, lista{i}, probabilidades{idx(i)});
end



%c) Calcular teoricamente as palavras ramarorara, arorao, roro
%   maramomorororora, omo
%   ramarorara:
%       Probabilidade - 1/4 x P(r -> a) x P(a -> m) x P(m -> a) x P(a -> r)
%                       x P(r -> o) x P(o -> r) x P(r -> a) x P(a -> r)
%                       x P(r -> a) 

%d) Importe a lista de palavras em portugues para um cell array. Com essa
%   lista e os resultados da questao b), estime a probabilidade de palavras
%   aleatorias gerar uma palavra valida em portugues

fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid,'%s');
fclose(fid);
dicionario = dicionario{1,1};
soma = 0;

for i = 1 : length(probabilidades)
    a = ismember(lista{i}, dicionario); %returns an array of booleans
    pos = find(a == true);              %return the position(s) of the true
    if(not(isempty(pos)))
        soma = soma + probabilidades{i};
    end
end
fprintf("A probabilidade de gerar uma palavra válida é de %.4f.\n", soma);








%My Functions
function [word] = generateWord(T)
    first = randi(4);  %Probabilidade de primeira letra é igual para todas
    state = crawl(T, first, 5);
    state = state(1: length(state)-1);
    set_of_letters= 'roma';
    word = set_of_letters(state);  %Substituir estado por letra
end

%Anexo
% Random walk on the Markov chain
% Inputs:
% t - state transition matrix
% first - initial state
% last - terminal or absorving state
function state = crawl(T, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(T, state(end));
        if (state(end) == last)
            break;
        end
    end
end

% Returning the next state
% Inputs:
% T - state transition matrix
% currentState - current state
function state = nextState(T, currentState)
% find the probabilities of reaching all states starting at the current one:
    probVector = T(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
% generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end