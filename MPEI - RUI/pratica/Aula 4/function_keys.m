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