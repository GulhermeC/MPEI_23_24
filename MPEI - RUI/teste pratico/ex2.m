fprintf("Ex1")
N = 10000;
imin = 5;
imax = 8;
alfabeto = ['a':'z' 'A':'Z'];
for i=1:10000
keys = generate_keys_unif(N, imin, imax, alfabeto);
difs = length(unique(keys));
end
Nu = 300;


words = generate_keys_unif(Nu, imin, imax, alfabeto);

result = cell(difs, 1)


for n = 1:Nu 
   result{n} = [result{n} words(n)];
end


function keys = generate_keys_unif(N, imin, imax, alfabeto)

comp = randi([imin, imax], N, 1);

keys = cell(N,1);

for w=1:N
pos = randi(length(alfabeto), 1, comp(w));
word = alfabeto(pos);
keys{w} = word;
end

end
