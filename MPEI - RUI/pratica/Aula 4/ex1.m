fprintf("Ex1")
N = 1e5;
imin = 6;
imax = 20;
alfabeto = ['a':'z' 'A':'Z'];
for i=1:1000
keys = generate_keys_unif(N, imin, imax, alfabeto);
difs = length(unique(keys));
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
