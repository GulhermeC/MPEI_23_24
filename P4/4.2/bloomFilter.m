function [bloomFilter, hashFunctions] = initBloomFilter(n, k)
    
    % Inicializa um vetor de zeros com o tamanho n
    bloomFilter = zeros(1, n);
    
    % Inicializa um cell array para as funções de dispersão
    hashFunctions = cell(1, k);

    for i = 1:k
        hashFunctions{i} = @(x) mod(customHashFunction(x, i), n) + 1;
    end
end

function bloomFilter = insertElement(bloomFilter, element, hashFunction)
    for i=1:length(hashFunction)
        hash=hashFunctions{i}(element);
        bloomFilter(hash) = 1;
    end
end

function isPresent = checkElement(bloomFilter, element, hashFunctions)
    isPresent = true;
    for i = 1:length(hashFunctions)
        if bloomFilter(hash) == 0
            isPresent = false;
            break;
        end
    end
end