
a = rand(2, 10000);
b = sum(a >0.5);
c = sum(b >= 1);
a = c/10000


e = rand(2, 10000);
f = sum(e >0.5);
g = sum(f == 2);
b = g/10000

i = rand(5, 10000);
j = sum(i >0.5);
k = sum(j == 2);
c = k/10000


n = rand(5, 10000);
m = sum(n >0.5);
o = sum(m >= 2);
d = o/10000

e = (nchoosek(5, 2)*0.5^2)*((1-0.5)^(5-2))

f = 0;
for i= 2:4
    y = (nchoosek(5, i)*0.5^i)*((1-0.5)^(5-i));
    f = f+y;

end

f
