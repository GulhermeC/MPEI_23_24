fprintf("2- a")

    %a   %b  %c
T = [1/3,1/4, 0
    1/3, 0.55, 1/2
    1/3, 1/5,  1/2];


R = T

fprintf("Prova que é estocastica")
R = sum(T)


fprintf("2- b")

a = [1/2 ; 1/4 ; 1/4];


R = a

fprintf("2- c")


v = T^30*a;

Grupo_a = round(v(1)*90)

Grupo_b = round(v(2)*90)

Grupo_c = round(v(3)*90)


fprintf("2- d")

a = [1/3 ; 1/3 ; 1/3];


v = T^30*a;

Grupo_a = round(v(1)*90)

Grupo_b = round(v(2)*90)

Grupo_c = round(v(3)*90)

