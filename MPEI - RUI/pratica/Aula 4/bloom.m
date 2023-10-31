fid = fopen("PL04_ficheiros_complementares\wordlist-preao-20201103.txt");
dicionario = textscane(fid,"$s");
f.close(fid);
dicionario = dicionario(1);