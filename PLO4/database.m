movies= readcell('movies.csv','Delimiter',',');

% Initialize an empty cell array to store genres
allGenres = {};

% Initialize a containers.Map to store genre counts
genreCounts = containers.Map('KeyType', 'char', 'ValueType', 'int32');

% Initialize a nested containers.Map to store genre-year counts
genreYearCounts = containers.Map('KeyType', 'char', 'ValueType', 'any');

% Loop through each movie entry
for i = 1:size(movies, 1)
    % Extract genres for this movie
    % Assuming genres start from column 3 till the end of the columns
    year = num2str(movies{i, 2});
    genres = movies(i, 3:end);
    
    % Remove any empty cells or NaN values
    genres = genres(~cellfun('isempty', genres));
    

    % Loop through each genre for this movie
    for j = 1:length(genres)
        % Ensure genre is a string and not missing
        if ~ismissing(genres{j})
            genre = char(genres{j});

            % Check if the genre is already in allGenres
            if ~ismember(genre, allGenres)
                % Append to the allGenres array
                allGenres{end + 1} = genre;
            end

            % =================== 2 =================== 

            % Update the count for each genre
            if isKey(genreCounts, genre)
                genreCounts(genre) = genreCounts(genre) + 1;
            else
                genreCounts(genre) = 1;
            end

            % =================== 3 ===================

            % Check if the genre is already in genreYearCounts
            if ~isKey(genreYearCounts, genre)
                genreYearCounts(genre) = containers.Map('KeyType', 'char', 'ValueType', 'int32');
            end

            % Update the count for each genre-year
            yearMap = genreYearCounts(genre);
            if isKey(yearMap, year)
                yearMap(year) = yearMap(year) + 1;
            else
                yearMap(year) = 1;
            end
            genreYearCounts(genre) = yearMap;
        end
    end

end

% =================== 4 ===================

shingle_size=3;
K = 150;  % Number of hash functions
MinHashSig = inf(length(movies), K);  % Initialize MinHash signatures

for i = 1:length(movies)
    conjunto = lower(movies{i,1});
    shingles = {};
    for j= 1 : length(conjunto) - shingle_size+1  % Criacao dos shingles para cada filme
        shingle = conjunto(j:j+shingle_size-1);
        shingles{j} = shingle;
    end
   
    
    for j = 1:length(shingles)
        chave = char(shingles(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashSig(i,:) = min([MinHashSig(i,:);hash]);  % Valor minimo da hash para este shingle
    end
end


save 'database' 'movies' 'allGenres' 'genreCounts' 'genreYearCounts' 'MinHashSig'