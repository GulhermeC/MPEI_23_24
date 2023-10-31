
p = 1/1000;
n = 8000;
k = 7;
tic
a = nchoosek(n, k)*((p)^k)*((1-p)^(n-k))
toc

tic
lameda = n*p;
b = (lameda^k)/factorial(k)*exp(-lameda)
toc

