function h = SDBM(chave, seed)
    len = length(chave);
    chave = double(chave);
    h = seed;
    for i = 1:len
        h = mod(chave(i) + bitshift(h, 6) + bitshift(h, 16) - h, 2^32 - 1);
    end
end