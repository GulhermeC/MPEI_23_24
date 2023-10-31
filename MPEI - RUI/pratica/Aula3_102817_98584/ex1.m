
fprintf("1-a\n")
     %Ir  %Não ir
T = [0.7, 0.8
     0.3, 0.2];

a = [1 ; 0];

R = T^2*a;
R = R(1)


fprintf("1-b\n")

a = [0 ; 1];

R = T^2*a;
R = R(1)


fprintf("1-c\n")

a = [1 ; 0];

R = T^29*a;
R = R(1)

fprintf("1-d\n")

a = [0.85; 0.15];

v = [1 : 30];
M = [a(2)];


for i=1:29

    g = T^i*a;

    M = [M, g(2)];


end


plot(v, M)

