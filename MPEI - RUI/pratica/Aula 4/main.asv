%--------------------------Ex1---------------------------------------
N = 1000;
imin = 6;
imax = 20;
alphabet = ['a':'z' 'A':'Z'];   %letras maiusculas e minusculas

for i = 1:N
    keys = generate_keys_uniform(N,imin,imax,alphabet);
    difs = length(unique(keys));
    %fprintf(1,"%3d - %d\n",i,difs);
end
%--------------------------Ex2---------------------------------------

N = 100000



















































++++++;
for T = [5e5 1e6 5e6] %tamanho da tabela

    hashcodes = zeros(N,1);
    atribuicoes = zeros(T,1);

    tic
    for k= 1:N
        %get key
        key = keys{k};
        %get hash code for key
        hash = string2hash(key);

        hash = rem(hash,T) + 1;  %transformar hash para [1..T]
        %disp(hash);
        %fprintf(1,"%3d - %20s - %d\n",k,key,hash)
        %guardar hashcodes
        hashcodes(k) = hash;

        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    colisoes = sum(atribuicoes > 1)
    fprintf(1,"%d,ncol = %d\n", T, colisoes);
    toc
end
%hist(hashcodes,100);
%hist(atribuicoes,0:6);
%[n,v] = hist(atribuicoes,0:6);

%--------------------------Ex3---------------------------------------






























function keys = generate_keys_uniform(N,imin,imax,alphabet)
%generate N words with length between imin abd imax....

%%1 determinar o comprimento
comp = randi([imin,imax],N,1);

%%2 escolher comp caracteres de forma aleatoria
keys = cell(N,1);
    %repetir 
    %escolher 1 carater <=> escolher posiçao do array
    for w=1:N
        pos = randi(length(alphabet),1,comp(w));
        word = alphabet(pos);
        keys{w} = word;
    end
end
