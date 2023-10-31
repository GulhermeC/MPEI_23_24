fprintf("3 - a")

n = 20;
T = rand(n, n);

for i=1:n
    T(:,i) = T(:,i)/sum(T(:,i));
end
R = T

fprintf("3 - b")


a = [1 ; zeros(19, 1)];

T20_2 = T^2*a;
T20_2 = T20_2(20) 

T20_5 = T^5*a;
T20_5 = T20_5(20)

T20_10 = T^10*a;
T20_10 = T20_10(20)

T20_100 = T^100*a;
T20_100 = T20_100(20)