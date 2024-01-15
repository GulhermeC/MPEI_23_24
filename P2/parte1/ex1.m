% Considere familias com filhos em que a probabilidade de nascimento de
% rapazes é igual à de nascimento de raparigas:

% a) Obtenha por simulação uma estimativa da probabilidade do acontecimento
% "ter pelo menos um filho rapaz" em familias com 2 filhos

E = 1e5;
p = 0.5;
f = 2;

mx = rand(f,E)>p;
prob = sum(mx)>=1;
a = sum(prob)/E;
disp(a);

% c) Suponha que para uma familia com 2 filhos escolhida ao acaso, sabemos
% que um dos filhos e rapaz. Qual a probabilidade do outro filho ser tambem
% rapaz?

E = 1e5;
p = 0.5;
f = 2;

mx = rand(f,E)>p;
boy = sum(mx);

one = sum(boy>=1);
two = sum(boy==2);

c = two/one;
disp(c);

% d) Sabendo que o primeiro filho de uma familia com 2 filhos e rapaz,
% determine por simulacao a probabilidade do segundo filho ser rapaz

E = 1e5;
p = 0.5;
f = 2;

mx = rand(f,E)>p;
one = sum(mx(1,:)==1);

boy = sum(mx);
two = sum(boy==2);

d = two/one;
disp(d);

% e) Considere uma familia com 5 filhos. Sabendo que pelo menso 1 dos
% filhos e rapaz, obtenha por simulacao uma estimativa para a probabilidade
% de um dos outros (e apenas um) ser tambem rapaz.

E = 1e5;
p = 0.5;
f = 5;

mx = rand(f,E)>p;
boy = sum(mx);

one = sum(boy>=1);
two = sum(boy==2);

e = two/one;

disp(e);

% f) Repita a alinea (e), mas estimando a probabilidade de pelo menos 1 dos
% outros ser tambem rapaz.

E = 1e5;
p = 0.5;
f = 5;

mx = rand(f,E)>p;
boy = sum(mx);

one = sum(boy>=1);
more = sum(boy>=2);

f = more/one;

disp(f);

