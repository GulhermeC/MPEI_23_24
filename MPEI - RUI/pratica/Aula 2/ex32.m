a = rand(4, 100000);
a = sum(sum(a > 0.5) == 1)/100000;

b = rand(4, 100000);
b = sum(sum(b > 0.5) == 1)/100000;

c = rand(4, 100000);
c = sum(sum(c > 0.5) == 1)/100000;

d = (a+b+c)/3

e = sqrt(d)