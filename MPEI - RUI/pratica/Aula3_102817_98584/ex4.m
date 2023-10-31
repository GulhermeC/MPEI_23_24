fprintf("4- a")

p = 0.4;

q = 0.6;

     %a   %b %c $d
T = [p^2, 0, 0, q^2
    (1-p)^2, 0, 0, q*(1-q)
    p*(1-p), 0, 0, q*(1-q)
    p*(1-p), 1, 1, (1-q)^2];

R = T


fprintf("4- b")

a = [1 ; 0 ; 0 ; 0];

h = T^5*a;
fprintf("5 transisões")
Prob_A = h(1)
Prob_B = h(2)
Prob_C = h(3)
Prob_D = h(4)

h = T^10*a;
fprintf("10 transisões")
Prob_A = h(1)
Prob_B = h(2)
Prob_C = h(3)
Prob_D = h(4)


h = T^100*a;
fprintf("100 transisões")
Prob_A = h(1)
Prob_B = h(2)
Prob_C = h(3)
Prob_D = h(4)

h = T^200*a;
fprintf("200 transisões")
Prob_A = h(1)
Prob_B = h(2)
Prob_C = h(3)
Prob_D = h(4)

fprintf("4- d")

M = [T - eye(4); ones(1, 4)];
x = [zeros(4, 1); 1];

R = M\x;

Lim_A = R(1)

Lim_B = R(2)

Lim_C = R(3)

Lim_D = R(4)