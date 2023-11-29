

% a) Gere um conjunto de N = 10^5 chaves usando todas as letras maiúscula e
% minúsculas ('A' a 'Z' e 'a' a 'z') com igual probabilidade e em que min =
% 6 e max = 20

N = 10^5; % Número de chaves
minLength = 6; % Comprimento mínimo
maxLength = 20; % Comprimento máximo
chars = [char('A':'Z'), char('a':'z')]; % Caracteres possiveis

    % Chamar funcao
keys = generateUniqueKeys(N, minLength, maxLength, chars);


% b) Gere um conjunto de N = 10^5 chaves usando todas as letra minuscula
% com a probabilidades contidas no cheiro prob_pt.txt e que correspondem à
% frequencia das letras em portugue. Considere novamente min = 6 e max = 20

N = 10^5;
minLength = 6;
maxLength = 20;
chars = char('a':'z');

    % Ler probabilidades do arquivo prob_pt.txt
fileID = fopen('PL04_ficheiros_complementares\prob_pt.txt', 'r');
probabilities = fscanf(fileID, '%f');
fclose(fileID);

    % Verificar e o tamanho de probabilitie é 26
if length(probabilities) ~= 26
    error('O arquivo de probabilidade deve conter 26 valores.');
end

    % Chamar funcao
keysB = generateUniqueKeys(N, minLength, maxLength, chars, probabilities);

% Crie uma função para gerar chaves constituídas por caracteres. 
% O comprimento (i.e., o número de caracteres) de cada chave 
% deve ser escolhido aleatoriamente (distribuição uniforme) entre min e max. 
% A função deve ter como parametros de entrada o número N de chave a gerar, 
% os valore de min e max, um vetor com os caracteres a usar nas chave e 
% um vetor com as probabilidades de cada um dos caracteres a utilizar. 
% Se a função for chamada sem o ultimo parametro, 
% deve considear os caracteres equiprováveis
% A função deve devolver um "cell array" com o conjunto de chaves geradas
% garantindo que as chaves são todas diferentes

function keys = generateUniqueKeys(N, minLength, maxLength, chars, varargin)
    if nargin == 4
        probabilities = ones(1, length(chars)) / length(chars);
    else
        probabilities = varargin{1};
    end

    keySet = containers.Map();
    keys = cell(1, N);

    while length(keySet) < N
        keyLength = randi([minLength, maxLength]);
        key = randsample(chars, keyLength, true, probabilities);
        keyStr = char(key);
        if ~isKey(keySet, keyStr)
            keySet(keyStr) = 1;
            keys{length(keySet)} = keyStr;
        end
    end
end
 






