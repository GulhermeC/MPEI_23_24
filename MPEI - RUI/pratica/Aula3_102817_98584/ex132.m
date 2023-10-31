T = [0.8,0,0.3, 0, 0
    0.2,0.6,0.2, 0, 0
    0,0.1,0.4, 0, 0
    0,0.3,0, 1, 0
    0,0,0.1, 0, 1];
fprintf("1-1 da parte 3.2 \n")
fprintf(" Confimação do 6 - 6\n")
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

fprintf("Confimação do 6 - 7\n")

a = [1 ; 0 ; 0 ; 0 ; 0];

f = [1 : 100];


for i=1:99

    y = T^i*a;

end

prob_3 = y(4)
prob_5 = y(5)

fprintf("1-2 da parte 3.2 \n")

a = [1/3 ; 1/3 ; 1/3 ; 0 ; 0];
h = a;
c = {h(1) , h(2) , h(3), h(4), h(5)};

for i=1:999

    h = T^i*a;

    v = {h(1) , h(2) , h(3), h(4), h(5)};

    c = [c ; v];


end


R = c