fprintf("7 - 1")
    %a %b %c %d %e %f
H = [1,0,0, 0,1/3, 0
    0,1/2,0, 0,1/3, 0
    0,1/2,0, 1,0, 0
    0, 0,1, 0,0, 0
    0,0,0, 0,0, 0
    0,0,0, 0,1/3, 0];

r = [1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6];

for i=1:9

    r = H*r;


end

R = r

fprintf("Pagina C de pagerank 0.2961\n")
fprintf("7 - 2\n")
fprintf("Spider trap são o cicolo C-D e o dead-end é o F\n")
fprintf("7 - 3")

H = [1,0,0, 0,1/3, 1/6
    0,1/2,0, 0,1/3, 1/6
    0,1/2,0, 1,0, 1/6
    0, 0,1, 0,0, 1/6
    0,0,0, 0,0, 1/6
    0,0,0, 0,1/3, 1/6];

r = [1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6];

for i=1:9

    r = H*r;


end

R = r

fprintf("7 - 5")

H = [1,0,0, 0,1/3, 1/6
    0,1/2,0, 0,1/3, 1/6
    0,1/2,0, 1/2,0, 1/6
    0, 0,1, 0,0, 1/6
    0,0,0, 1/2,0, 1/6
    0,0,0, 0,1/3, 1/6];

r = [1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6];

for i=1:9

    r = H*r;


end

R = r


fprintf("7 - 6")

i = 1;

b = [1: 6];
r = [1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6 ; 1/6];

while b(1)-r(1) > 10^-4 ||  b(2)-r(2) > 10^-4  ||  b(3)-r(3) > 10^-4 ||  b(4)-r(4) > 10^-4 ||  b(5)-r(5) > 10^-4 ||  b(6)-r(6) > 10^-4
    b = r;
    i  = i+1;
    r = H*r;


end

R = r



