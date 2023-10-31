fprintf("1-2 \n")
T = [0.1,0.3,0.25,0.5
    0.3,0.1,0.25,0.3
    0.3,0.3,0.1,0.1
    0.3, 0.3,0.4,0.1];

fprintf("Ordem: \n")
fprintf("A   | B    |    C |  D")
T

fprintf("1-3 \n")

a = [1/4 ; 1/4 ; 1/4 ; 1/4];

R = T^5*a;
R = R(2)

fprintf("1-4 \n")


M = [T-eye(4); ones(1, 4)];
x = [zeros(4, 1); 1];

r = M\x;

fprintf("Probablidade limite: ")
prob_A = r(1)
prob_B = r(2)
prob_C = r(3)
prob_D = r(4)

t = 0;
a = r;
for i=150:510

    y = T^i*a;
    t = t+y(2);
end

fprintf("Tempo por hora: \n")
R = t*2/12

fprintf("1-5 \n")

a = [1 ; 0 ; 0 ; 0];

t = 1/4;
p1 = T^1*a;
p1=  p1(2);

p2 = T^5*a;
p2 =  p2(2);

p3 = T^6*a;
p3 =  p3(1);

R = t*p1*p2*p3
