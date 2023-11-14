%1)

%       A     B    C      D   
M = [ 0.1  0.3  0.25    0.5
      0.3  0.1  0.25    0.3
      0.3  0.3  0.1     0.1
      0.3  0.3  0.40    0.1];

sum(M)




m5 = M^5

m5(2)

M_30 = M^30;
media_B = mean(M_30(:, 2))

n_vezes_b = media_B * 30


m360 = M^360;

p_a = 1/4 * M(1,2) * M (2,1) * M(2,1)
p_b = 1/4 * M(1,2) * M (2,1) * M(2,2)
p_c = 1/4 * M(1,2) * M (2,1) * M(2,3)
p_d = 1/4 * M(1,2) * M (2,1) * M(2,4)

total = p_a + p_c + p_d + p_b

%2)
load('L.mat')

L;

zero_col_indices = find(all(L == 0));  
disp(zero_col_indices); 

% Fator de amortecimento
d = 0.85;

num_iteracoes = 1;
pagerank = ones(110, 1) / 110;
% Algoritmo de PageRank
for i = 1:num_iteracoes
    pagerank = (1 - d) / 110 + d * (L * pagerank);
end
pagerank(27)
pagerank(53)
pagerank(74)


% Fator de amortecimento
d = 0.85

% Limite para a mudança nos valores do PageRank
epsilon = 1e-4;
convergiu = false;
iteracoes = 0;

pagerank = ones(110, 1) / 110;
% Algoritmo de PageRank com critério de convergência
while ~convergiu
    iteracoes = iteracoes + 1;
    new_pagerank = (1 - d) / 110 + d * (L * pagerank);
    
    % Verifica se a mudança é menor que epsilon
    if all(abs(new_pagerank - pagerank) < epsilon)
        convergiu = true;
    end
    pagerank = new_pagerank;
end


%3)

%       1   3   5   7   9   .               
B = [   0 0.3   0 0.3   0   0
      1/3   0 0.5  0 0.45   0
      1/3 0.3   0 0.3   0   0
      1/3   0 0.5  0 0.45   0
        0 0.3   0 0.3   0   0
        0 0.1   0 0.1 0.1   0];

sum(B)




N = 1e2;
lista= {};
cont = 0;
num = 0;
med = 0;
lista{1} = generateWord(B);
palavra = '97153';

% Preencher cell array da lista de palavras unicas e cell array de
% contadores
for i = 2 : N
    word = generateWord(B);
    if (strcmp(word,palavra) )
        cont = cont + 1;
    end
    if (startsWith(word, '7'))
        med = med + length(word);
        num = num + 1;
    end
    lista{end+1} = word;
end

lista;

cont
prob = cont/length(lista)
med = med / num

% Gerar word
function [word] = generateWord(B)
% Ajustando a distribuição de probabilidade para o estado inicial
prob = ones(1, 5);  % Cria um vetor com probabilidades iguais
prob(2) = 0.5;  % Reduz a probabilidade do estado 2
prob(5) = 0.5;  % Reduz a probabilidade do estado 5
prob = prob / sum(prob);  % Normaliza para que a soma seja 1

% Escolhendo o estado inicial com a distribuição ajustada
first = randsample(5, 1, true, prob);
state = crawl(B, first, 6);
state = state(1: length(state)-1);
set_of_letters= '13579';
word = set_of_letters(state);  %Substituir estado por letra
end

% if the Markov chain has more than 1 absorving state the third argument
% must be a vector with the absorving states
% for example in a chain with 5 states,and considering that states 4 and 5 are absorbing states:
% state = crawl(H5, 1,  [4 5])  
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if ismember(state(end), last) % verifies if state(end) is absorving
              break;
          end
     end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
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