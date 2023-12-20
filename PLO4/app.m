clc;
clear all;

load database;
% movies allGenres genreCounts genreYearCounts MinHashSig MinHashSigGen

op = 0;
menu(op, movies, allGenres, genreCounts, genreYearCounts, MinHashSig, MinHashSigGen);

function menu(op, movies, allGenres, genreCounts, genreYearCounts, MinHashSig, MinHashSigGen)
    while(isempty(op) | op < 6)
        fprintf('\n1 - Display available genres\n2 - Number of movies of a genre\n3 - Number of a genre on a given year\n4 - Search movie titles\n5 - Search movies based on genres\n6 - Exit\nSelect an option: ')
        op = str2num(input('', 's'));
        
        % Skip if empty
        if isempty(op)
            continue;
        end

        switch op
            case 1
                dispGenres(allGenres)
            case 2
                moviesGen(genreCounts)
            case 3
                moviesGenYr(genreYearCounts)
            case 4
                searchMovie(movies, MinHashSig)
            case 5
                searchMovieGen(movies, MinHashSigGen, allGenres)
            case 6
                clc
                break;
            otherwise
                op = 0;
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
    if length(inputParts) ~= 2
        fprintf('Invalid input format. Please enter a genre and a year separated by a comma.\n');
        return;
    end

    % Extract genre and year
    gen = strtrim(inputParts{1});
    yr = strtrim(inputParts{2});
    %gen = 'Adventure';
    %yr = '1995';
    genreYearKey = [gen '-' yr]; % Concatenating genre and year to create a unique key

    % Bloom filter parameters
    n = numel(genreYearCounts.keys);
    p = 0.01;
    m = ceil((n * log(p)) / log(1 / (2 ^ log(2))));
    k = round((m / n) * log(2));
    bloomFilter = false(1, m);

    % Populate the Bloom filter with genre-year combinations
    genres = genreYearCounts.keys;
    for i = 1:length(genres)
        yearMap = genreYearCounts(genres{i});
        years = yearMap.keys;
        for j = 1:length(years)
            combinedKey = [genres{i} '-' years{j}];
            for l = 1:k
                hash = DJB31MA(combinedKey, l);
                bloomIndex = mod(hash, m) + 1;
                bloomFilter(bloomIndex) = true;
            end
        end
    end

    % Check if the genre-year is possibly in the Bloom filter
    isPossible = true;
    for j = 1:k
        hash = DJB31MA(genreYearKey, j);
        bloomIndex = mod(hash, m) + 1;
        if ~bloomFilter(bloomIndex)
            isPossible = false;
            break;
        end
    end

    if isPossible
        % In case of false positives
        if isKey(genreYearCounts, gen) && isKey(genreYearCounts(gen), yr)
            yearMap = genreYearCounts(gen);   
            count = yearMap(yr);
            fprintf('There are %d movies in the genre "%s" for the year %s.\n', count, gen, yr);
        else
            fprintf('Error in data introduction: No data available for the genre "%s" in the year %s.\n', gen, yr);
        end
    else
        fprintf('Error in data introduction: No data available for the genre "%s" in the year %s.\n', gen, yr);
    end
end

% OP 4
function searchMovie(movies, MinHashSig)
    str = lower(input('\nWrite a String: ', 's'));
    shingle_size = 3;  % Use the same number of shingles as in the database
    K = size(MinHashSig, 2);  % Use the same K as used in the database for genre shingles

   % Cell array with shingles from the input string
    shinglesAns = {};
    for i = 1:length(str) - shingle_size+1
        shingle = str(i:i+shingle_size-1);
        shinglesAns{i} = shingle;
    end

    % Fazer a MinHash dos shingles da string introduzida
    MinHashString = inf(1,K);
    for j = 1:length(shinglesAns)
        chave = char(shinglesAns{j});
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashString(1,:) = min([MinHashString(1,:); hash]);
    end

    % Jaccard distance between the input string and each movie
    distJ = zeros(1, size(movies,1)); % Array to store distances
    h = waitbar(0,'Calculating');
    for i=1:size(movies, 1)
        waitbar(i/K, h);
        distJ(i) = sum(MinHashSig(i,:) ~= MinHashString)/K;
        distJ(i) = 1 - distJ(i);
    end
    delete(h);

    for i = 1:5
        [val, pos] = max(distJ); % Calculate the maximum value (highest similarity)
        fprintf('%s   (%f)\n', movies{pos, 1}, val);
        distJ(pos) = 0;   % Exclude this movie by setting its distance to 1
    end
    
    
    fprintf(2, 'Press any key to continue. ');
    pause;clc;  % Keep the information available until the user presses any key 
end

% OP 5
function searchMovieGen(movies, MinHashSig, allGenres)
    isValidGenre = false;
    while ~isValidGenre
        str = input('\nEnter Genre(s): ', 's');
        inputGenres = strsplit(str, ','); % Splitting genres by comma
        inputGenres = strtrim(inputGenres); % Trimming whitespace
        inputGenres = lower(inputGenres);

        lowerAllGenres = lower(allGenres);

        % Checking if each input genre is in allGenres
        isValidGenre = all(ismember(inputGenres, lowerAllGenres));

        if ~isValidGenre
            fprintf('Invalid genre(s). Please enter existing genre(s).\n');
            fprintf('You entered: %s\n', strjoin(inputGenres, ', ')); % Debug print
        end
    end
    
    str = lower(str);
    shingle_size = 3;  % Use the same number of shingles as in the database
    K = size(MinHashSig, 2);  % Use the same K as used in the database for genre shingles

    % Cell array with shingles from the input string
    shinglesAns = {};
    for i = 1:length(str) - shingle_size + 1
        shingle = str(i:i + shingle_size - 1);
        shinglesAns{i} = shingle;
    end

    % Compute the MinHash of the input string's shingles
    MinHashString = inf(1, K);
    for j = 1:length(shinglesAns)
        chave = char(shinglesAns{j});
        hash = zeros(1, K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashString(1, :) = min([MinHashString(1, :); hash]);
    end

    % Jaccard distance between the input string and each movie
    distJ = zeros(1, size(movies, 1));  % Array to store distances
    h = waitbar(0, 'Calculating');
    for i = 1:size(movies, 1)
        waitbar(i / K, h);
        distJ(i) = sum(MinHashSig(i, :) ~= MinHashString) / K;
        distJ(i) = 1 - distJ(i);
    end
    delete(h);

    % Find and display the top 5 matches
    for i = 1:5
        [val, pos] = max(distJ);  % Calculate the maximum value (highest similarity)
        fprintf('%s   (%f)\n', movies{pos, 1}, val);
        distJ(pos) = 0;  % Exclude this movie by setting its distance to 1
    end

    fprintf(2, 'Press any key to continue. ');
    pause; clc;  % Keep the information available until the user presses any key
end

