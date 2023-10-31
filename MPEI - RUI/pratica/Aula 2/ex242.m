function a = rand242(n, p)

for k = 0:5
a = (nchoosek(n,k)*p^k)*((1-p)^(n-k))
end

a = 0;
v = 0.3;
for k = 2:5
j = (nchoosek(n,k)*v^k)*((1-v)^(n-k));
a = j+a;
end

a


end