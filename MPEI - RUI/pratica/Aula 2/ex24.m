p = 0.3;
e = 1e5

a = rand(2, e);
b = sum(a <= 0.3);
c = sum(b == 1)/e

a = rand(4, e);
b = sum(a <= 0.3);
c = sum(b == 2)/e

a = nchoosek(2,1)*((0.3))*((0.7))

a = nchoosek(4,2)*((0.3)^2)*((0.7)^2)

