clc;
clear all;

load database; % allGenres genreCounts genreYearCounts

op = 0;
menu(op, allGenres, genreCounts, genreYearCounts);

function menu(op, genres, genreCounts, genreYearCounts)
    while(isempty(op) | op < 6)
        fprintf('\n1 - Display available genres\n2 - Number of movies of a genre\n3 - Number of a genre on a given year\n4 - Search movie titles\n5 - Search movies based on genres\n6 - Exit\nSelect an option: ')
        op = str2num(input('', 's'));
        
        % Skip if empty
        if isempty(op)
            continue;
        end

        switch op
            case 1
                dispGenres(genres)
            case 2
                moviesGen(genreCounts)
            case 3
                moviesGenYr(genreYearCounts)
            case 4
                searchMovie()
            case 5
                searchMovieGen()
            case 6
                clc
                break;
            otherwise
                option = 0;
                clc
        end
        fprintf('\n');
    end
end

% OP 1
function dispGenres(genres)
    fprintf('Display genres');
    display(genres)
end

% OP 2
function moviesGen(genreCounts)

    % Number of elements expected to add
    n = numel(genreCounts.keys);
    % Probability of false positives
    p = 0.01;

    % Size of the bit array
    m = ceil((n * log(p)) / log(1 / (2 ^ log(2))));
    % Number of hash functions
    k = round((m / n) * log(2));

    % Initialize Bloom filter (bit array)
    bloomFilter = false(1, m);

    % Populate Bloom filter
    genres = genreCounts.keys;
    for i = 1:length(genres)
        for j = 1:k
            % Using DJB31MA with varying seeds
            hash = DJB31MA(genres{i}, j);
            bloomIndex = mod(hash, m) + 1;
            bloomFilter(bloomIndex) = true;
        end
    end

    fprintf('Select a genre: ');
    gen = input('', 's');

    % Check if the genre is possibly in the Bloom filter
    isPossible = true;
    for j = 1:k
        hash = DJB31MA(gen, j);
        bloomIndex = mod(hash, m) + 1;
        if ~bloomFilter(bloomIndex)
            isPossible = false;
            break;
        end
    end

    if isPossible
        if isKey(genreCounts, gen)
            count = genreCounts(gen);
            fprintf('The genre "%s" has %d movies.\n', gen, count);
        end
    else
        fprintf('The genre "%s" is not part of the keys.\n', gen);
    end
end

% OP 3
function moviesGenYr(genreYearCounts)
    fprintf("Select a genre and a year (separated by ','): ");
    in = input('', 's');
    
    inputParts = strsplit(in, ',');

    % Check if the input format is correct
    if length(inputParts) == 2
        % Extract genre and year
        gen = strtrim(inputParts{1});
        yr = strtrim(inputParts{2});
    end
end

% OP 4
function searchMovie()
    fprintf('Insert a string: ');
    in = input('', 's');
end

% OP 5
function searchMovieGen()
    fprintf("Select one or more genres (separated by ','): ");
    gen = input('', 's');
end