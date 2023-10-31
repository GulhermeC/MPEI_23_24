T = [0.8,0,0.3, 0, 0
    0.2,0.6,0.2, 0, 0
    0,0.1,0.4, 0, 0
    0,0.3,0, 1, 0
    0,0,0.1, 0, 1];
fprintf("6 - 1")

R = T

fprintf("6 - 2")

a = [1 ; 0 ; 0 ; 0 ; 0];

f = [1 : 100];

M = [a(2)];

for i=1:99

    y = T^i*a;
    M = [M , y(2)];

end

plot(f, M)

fprintf("6 - 3")

a = [1 ; 0 ; 0 ; 0 ; 0];

f = [1 : 100];

M = [a(4)];
O = [a(5)];

for i=1:99

    y = T^i*a;
    M = [M , y(4)];
    O = [O , y(5)];

end

M = [M ; O];
plot(f, M)

fprintf("6 - 4")

Q = [0.8,0,0.3
    0.2,0.6,0.2
    0,0.1,0.4];

R = Q

fprintf("6 - 5")

M = eye(size(Q))-Q;
F = inv(M);

R = F


fprintf("6 - 6\n")
fprintf("Estado 1: ")

a = [1 ; 0 ; 0 ; 0 ; 0];

l = 1;

for i=1:100

    h = T^i*a;
    l = l+h(1)+h(2)+h(3);


end

R = l


fprintf("Estado 2: ")

a = [0 ; 1 ; 0 ; 0 ; 0];

l = 1;

for i=1:100

    h = T^i*a;
    l = l+h(1)+h(2)+h(3);


end

R = l

fprintf("Estado 4: ")

a = [0 ; 0 ; 1 ; 0 ; 0];

l = 1;

for i=1:100

    h = T^i*a;
    l = l+h(1)+h(2)+h(3);


end

R = l

fprintf("6 - 7\n")

a = [1 ; 0 ; 0 ; 0 ; 0];

f = [1 : 100];


for i=1:99

    y = T^i*a;

end

prob_3 = y(4)
prob_5 = y(5)





