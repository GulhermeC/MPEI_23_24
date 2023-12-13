% =============================== Ex1 ================================== %
fprintf('\n =============================== Ex1 ================================== \n');

% Codigo base para deteçao de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes

% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Numero de utilizadores

% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1);    % Usa celulas

for n = 1:Nu        % Para cada utilizador
    % Obtem os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa celulas porque utilizador tem um numero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

% Lista de todos os filmes únicos
all_movies = unique(u(:,2));

% Inicializa os vetores lógicos para cada usuário
logical_sets = false(Nu, length(all_movies));

% Preenche os vetores lógicos
for n = 1:Nu
    user_movies = Set{n};
    logical_sets(n, ismember(all_movies, user_movies)) = true;
end

%% Calcula a distancia de Jaccard entre todos os pares pela definiçao.
J=zeros(Nu, Nu); % array para guardar distancias
h= waitbar(0,'Calculating Jaccard Distances');

% Inicializa o cronômetro para cputime
start_cputime = cputime;

% Inicializa o cronômetro para etime
start_etime = clock;
tic; % Inicia o cronometro para medir tempo
for n1 = 1:Nu
    waitbar(n1/Nu, h);
    for n2 = n1+1:Nu
        % Cálculo da distância de Jaccard usando vetores lógicos
        intersection_length = sum(logical_sets(n1,:) & logical_sets(n2,:));
        union_length = sum(logical_sets(n1,:) | logical_sets(n2,:));
        
        if union_length == 0
            J(n1, n2) = 1; % Considera a distância máxima se a união for vazia
        else
            J(n1, n2) = 1 - (intersection_length / union_length);
        end
    end
end
tempo_calculo = toc;

delete (h)
save('jaccard_distances.mat', 'J');

%% Com base na distancia, determina pares com
%% distancia inferior a um limiar pre-definido

threshold =0.4; % limiar de decisao

% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= [];
k= 1;
tic; % Inicia o cronometro para medir o tempo de detecção de pares

for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2) < threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end

tempo_deteccao = toc;
% Calcula o tempo de CPU utilizado
total_cputime = cputime - start_cputime;

% Calcula o tempo total usando etime
total_etime = etime(clock, start_etime);

% Exibe o número de pares similares e informações sobre cada par
disp(['Numero de pares similares: ' num2str(size(SimilarUsers, 1))]);
disp('Informacoes dos pares similares (User1, User2, Distancia Jaccard):');
disp(SimilarUsers);

% Exibe os tempos de cálculo e detecção
disp(['Tempo para calcular distancias: ' num2str(tempo_calculo) ' segundos']);
disp(['Tempo para detectar pares similares: ' num2str(tempo_deteccao) ' segundos']);
disp(['Tempo de CPU para calcular distâncias: ' num2str(total_cputime) ' segundos']);
disp(['Tempo total para calcular distâncias (etime): ' num2str(total_etime) ' segundos']);

% =============================== Ex2 ================================== %
fprintf('\n =============================== Ex2 ================================== \n');

% Carrega o ficheiro dos dados dos filmes
udata = load('u.data'); 

% Identificar IDs únicos dos usuários
unique_users = unique(udata(:,1));

% Verificar se há pelo menos 100 usuários
if length(unique_users) < 100
    error('Menos de 100 usuários únicos disponíveis.');
end

% Selecionar aleatoriamente 100 IDs únicos
rand_indices = randperm(length(unique_users), 100);
selected_users = unique_users(rand_indices);

% Filtrar os dados para incluir apenas os registros dos usuários selecionados
u_random_100 = udata(ismember(udata(:,1), selected_users), :);

u= u_random_100(1:end,1:2); clear udata;

% Testando as funções
Set = criarConjuntosFilmes(u);
J = calcularDistanciasJaccard(Set);
% Limiar de similaridade
threshold = 0.4; 
users = unique(u(:,1));
paresSimilares = encontrarParesSimilares(J, users, threshold);

% Exibir os resultados
disp('Pares de usuários com distância de Jaccard inferior ao limiar:');
disp(paresSimilares);


% =============================== Ex3 ================================== %
fprintf('\n =============================== Ex3 ================================== \n');

% Carrega o ficheiro dos dados dos filmes
udata = load('u.data'); 

u= udata(1:end,1:2); clear udata;

% Testando as funções
Set = criarConjuntosFilmes(u);
J = calcularDistanciasJaccard(Set);

% Limiar de similaridade
threshold = 0.4; 
users = unique(u(:,1));
paresSimilares = encontrarParesSimilares(J, users, threshold);

% Exibir os resultados
disp('Pares de usuários com distância de Jaccard inferior ao limiar:');
disp(paresSimilares);

% =============================== Ex4 ================================== %
fprintf('\n =============================== Ex4 ================================== \n');

% Carrega o ficheiro dos dados dos filmes
udata = load('u.data');

% Identificar os IDs únicos dos usuários
unique_users = unique(udata(:,1));

% Extrair os dados dos primeiros 50 usuários
first_50_users = unique_users(1:50);
u_50 = udata(ismember(udata(:,1), first_50_users), :);

% Extrair os dados dos primeiros 100 usuários
first_100_users = unique_users(1:100);
u_100 = udata(ismember(udata(:,1), first_100_users), :);

% Extrair os dados dos primeiros 200 usuários
first_200_users = unique_users(1:200);
u_200 = udata(ismember(udata(:,1), first_200_users), :);

Set50 = criarConjuntosFilmes(u_50); % u_50 representa os dados dos primeiros 50 usuários
Set100 = criarConjuntosFilmes(u_100);
Set200 = criarConjuntosFilmes(u_200);
J_50 = calcularDistanciasJaccardMinHash(Set50, 50);  % k = 50
J_100 = calcularDistanciasJaccardMinHash(Set100, 100); % k = 100
J_200 = calcularDistanciasJaccardMinHash(Set200, 200); % k = 200

disp('Distâncias de Jaccard para k = 50:');
disp(J_50);
disp('Distâncias de Jaccard para k = 100:');
disp(J_100);
disp('Distâncias de Jaccard para k = 200:');
disp(J_200);

% ============================ Funções Ex2 =============================== %
function Set = criarConjuntosFilmes(u)
    
    % Lista de utilizadores
    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    Nu = length(users); % Numero de utilizadores

    % Constroi a lista de filmes para cada utilizador
    Set = cell(Nu,1); % Usa células

    for n = 1:Nu % Para cada utilizador
        % Obtem os filmes de cada um
        ind = find(u(:,1) == users(n));
        % E guarda num array. Usa células porque utilizador tem um numero
        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = u(ind,2)';
    end
end

function J = calcularDistanciasJaccard(Set)
    Nu = length(Set); % Número de usuários
    J = zeros(Nu); % Inicializa a matriz de distâncias

    for n1 = 1:Nu
        for n2 = n1+1:Nu
            intersection_length = length(intersect(Set{n1}, Set{n2}));
            union_length = length(union(Set{n1}, Set{n2}));
            
            if union_length == 0
                J(n1, n2) = 1; % Considera a distância máxima se a união for vazia
            else
                J(n1, n2) = 1 - (intersection_length / union_length);
            end
        end
    end
end

function paresSimilares = encontrarParesSimilares(J, users, threshold)
    Nu = length(J); % Número de usuários
    paresSimilares = []; % Inicializa o array para os pares similares

    for n1 = 1:Nu
        for n2 = n1+1:Nu
            if J(n1, n2) < threshold
                paresSimilares = [paresSimilares; users(n1) users(n2) J(n1, n2)];
            end
        end
    end
end

% ============================ Funções Ex4 =============================== %

function minHashSignatures = calcularMinHash(Set, k)
    num_usuarios = length(Set);
    max_movie_id = max(cellfun(@max, Set));
    minHashSignatures = inf(num_usuarios, k);

    for i = 1:k
        hash_function = @(x) mod(randi(1000000) * x + randi(1000000), max_movie_id);
        for j = 1:num_usuarios
            hashed_values = arrayfun(hash_function, Set{j});
            if ~isempty(hashed_values)
                minHashSignatures(j, i) = min(hashed_values);
            end
        end
    end
end

function J = calcularDistanciasJaccardMinHash(Set, k)
    % Calcular assinaturas MinHash
    minHashSignatures = calcularMinHash(Set, k);

    % Calcular a distância de Jaccard aproximada
    num_usuarios = size(minHashSignatures, 1);
    J = zeros(num_usuarios);
    for i = 1:num_usuarios
        for j = i+1:num_usuarios
            similarity = sum(minHashSignatures(i, :) == minHashSignatures(j, :)) / k;
            J(i, j) = 1 - similarity;
        end
    end
end
