
e = 1e5;
n = 0;

n1 = 0;


for i=0:4

a = rand(4, e);
b = sum(a > 0.5);
c = sum(b == n);
d = sum(c)/(e)
n = n+1;

end


a = rand(4, e);
b = sum(a > 0.5);
n0 = sum(b == 0);

a = rand(4, e);
b = sum(a > 0.5);
n1 = sum(b == 1);

a = rand(4, e);
b = sum(a > 0.5);
n2 = sum(b == 2);

a = rand(4, e);
b = sum(a > 0.5);
n3 = sum(b == 3);

a = rand(4, e);
b = sum(a > 0.5);
n4 = sum(b == 4);

n = (n0+n1+n2+n3+n4)/5



