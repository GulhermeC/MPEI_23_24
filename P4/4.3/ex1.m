% Codigo base para deteçao de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes

% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Numero de utilizadores

% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1);    % Usa celulas

for n = 1:Nu,       % Para cada utilizador
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

threshold =0.4 % limiar de decisao

% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= [];
k= 1;
tic; % Inicia o cronometro para medir o tempo de detecção de pares
for n1= 1:Nu,
    for n2= n1+1:Nu,
        if J(n1,n2) < threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)]
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