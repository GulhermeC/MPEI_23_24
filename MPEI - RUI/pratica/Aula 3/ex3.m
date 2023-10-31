
n = 3;
T = rand(n, n)

for i=1:n
    T(:,i) = T(:,i)/sum(T(:,i));
end
sum(T)

T5 = T^5
