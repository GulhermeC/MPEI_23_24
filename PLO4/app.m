clc;
clear all;

load database; % allGenres genreCounts

op = 0;
menu(op, allGenres, genreCounts);

function menu(op, genres, genreCounts)
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
                moviesGenYr()
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
    fprintf('Select a genre: ');
    gen = input('', 's');
    if isKey(genreCounts, gen)
        fprintf('The genre "%s" is part of the keys.\n', gen);
        count = genreCounts(gen);
        fprintf('The genre "%s" has %d movies.\n', gen, count);
    else
        fprintf('The genre "%s" is not part of the keys.\n', gen);
    end
end

% OP 3
function moviesGenYr()
    fprintf("Select a genre and a year (separated by ','): ");
    in = input('', 's');
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