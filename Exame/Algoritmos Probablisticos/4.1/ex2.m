% Considere a função Matlab string2hash() que implementa 2 funções de
% dispersão diferente. Considere ainda 2 funçõe Matlab fornecida que sao
% adaptações para Matlab das funções de dispersão hashstring() e DJB31MA()

% Utilizando separadamente cada uma destas quatro funções de dispersão,
% simule a inserção das chaves criadas em 3 Chaining Hash Tables, uma de
% tamanha 5 * 10^5, outra do tamanho 10^6 e terceira do tamanha 2 * 10^6

% a) Guarda um vetor com os hashcodes obtidos
% b) Registe o numero de atribuições a cada uma das posições de cada Hash
% Table
% c) Calcule o numero de colisoes (em cada hash table e para cada função de
% dispersao)
% d) O tempo de execução da simulação

% Iniciar cronometro
tic;

N = 10^5;
keys = generateUniqueKeys(N, 6, 20, char('a':'z'));

% Tamanhos da Hash Tables
tableSizes = [5*10^5, 10^6, 2*10^6];

% Inicializar estrutura para armazenar hash codes
hashcodes = struct();
counts = struct();
collisions = struct();

% Aplicar funções de dispersao
hashFunctions = {'hashstring', 'DJB31MA', 'djb2', 'sdbm'};
for f = 1:length(hashFunctions)
    func = hashFunctions{f};
    for tSize = tableSizes
        fieldName = ['size' num2str(tSize)];

        % Inicializar vetor de hashcodes par ao tamanho atual da tablea
        hashcodes.(func).(fieldName) = zeros(N, 1);
        
        counts.(func).(fieldName) = zeros(tSize, 1);

        collisions.(func).(fieldName) = 0;

        for k = 1:N
            switch func
                case 'hashstring'
                    hashValue = hashstring(keys{k});
                case 'DJB31MA'
                    hashValue = DJB31MA(keys{k});
                case {'djb2', 'sdbm'}
                    hashValue = string2hash(keys{k}, func);
            end
            % Modulo para ajudar ao tamanho da tabela
            hashValue = mod(hashValue, tSize) + 1;
            hashcodes.(func).(fieldName)(k) = hashValue;

            % Incrementar contagem para a posição correspondente
            if counts.(func).(fieldName)(hashValue) > 0
                % Se já houver uma chave nessa posição, incrementar colisões
                collisions.(func).(fieldName) = collisions.(func).(fieldName) + 1;
            end

            % Incrementar contagem para a posição correspondente
            counts.(func).(fieldName)(hashValue) = counts.(func).(fieldName)(hashValue) + 1;
        end
    end
end

disp(hashcodes);
disp(counts);
disp(collisions);

% Parar cronômetro e exibir tempo de execução
tempoExecucao = toc;
fprintf('Tempo de execução da simulação: %.2f segundos.\n', tempoExecucao);



% Funções complementares
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

function hashValue = hashstring(str)
    hashValue = 0;
    for i = 1:length(str)
        hashValue = hashValue + double(str(i));
    end
    % Aplicar um módulo para manter o hashValue dentro de um intervalo
    hashValue = mod(hashValue, 1000);
end

function hashValue = DJB31MA(str)
    hashValue = 5381; % Valor inicial
    for i = 1:length(str)
        hashValue = mod(hashValue * 31 + double(str(i)), 2^32);
    end
end


function hash = string2hash(str,type)
% This function generates a hash value from a text string
%
% hash=string2hash(str,type);
%
% inputs,
%   str : The text string, or array with text strings.
% outputs,
%   hash : The hash value, integer value between 0 and 2^32-1
%   type : Type of has 'djb2' (default) or 'sdbm'
%
% From c-code on : http://www.cse.yorku.ca/~oz/hash.html 
%
% djb2
%  this algorithm was first reported by dan bernstein many years ago 
%  in comp.lang.c
%
% sdbm
%  this algorithm was created for sdbm (a public-domain reimplementation of
%  ndbm) database library. it was found to do well in scrambling bits, 
%  causing better distribution of the keys and fewer splits. it also happens
%  to be a good general hashing function with good distribution.
%
% example,
%
%  hash=string2hash('hello world');
%  disp(hash);
%
% Function is written by D.Kroon University of Twente (June 2010)


% From string to double array
    str=double(str);
    if(nargin<2), type='djb2'; end
    switch(type)
        case 'djb2'
            hash = 5381*ones(size(str,1),1); 
            for i=1:size(str,2)
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i=1:size(str,2)
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs','unknown type');
    end
end