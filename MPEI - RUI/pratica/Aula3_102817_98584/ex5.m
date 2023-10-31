fprintf("5 - 1")

     %s  %n %c
T = [0.7,0.2,0.3
    0.2,0.3,0.3
    0.1,0.5,0.4];

R = T

fprintf("5 - 2")

a = [1 ; 0 ; 0];

h = T^1*a;

Prob_2 = h(1)

h = T^2*a;

Prob_3 = h(1)


fprintf("5 - 3")

a = [1 ; 0 ; 0];

h = T^1*a;

Prob_2 = h(1)+h(2)

h = T^2*a;

Prob_3 = h(1)+h(2)

fprintf("5 - 4")

v = [1 ; 0 ; 0];

respSol= v(1);

respNuvens= v(2);

respChuva= v(3);

for i=2:31

    v= T*v;

    respSol= respSol+v(1);

    respNuvens= respNuvens+v(2);

    respChuva= respChuva+v(3);

end



prob_Sol = respSol
prob_Nuvens = respNuvens
prob_Chuva = respChuva


fprintf("5 - 5")

v = [0 ; 0; 1];

respSol= v(1);

respNuvens= v(2);

respChuva= v(3);

for i=2:31

    v= T*v;

    respSol= respSol+v(1);

    respNuvens= respNuvens+v(2);

    respChuva= respChuva+v(3);

end



prob_Sol = respSol
prob_Nuvens = respNuvens
prob_Chuva = respChuva



fprintf("5 - 6\n")

fprintf("Sol:")

v = [1 ; 0 ; 0];

respSol= v(1)*0.1;

respNuvens= v(2)*0.3;

respChuva= v(3)*0.5;

for i=2:31

    v= T*v;

    respSol= respSol+(v(1)*0.1);

    respNuvens= respNuvens+(v(2)*0.3);

    respChuva= respChuva+(v(3)*0.5);

end



prob = round(respSol+respNuvens+ respChuva)

fprintf("Chuva")
v = [0 ; 0; 1];

respSol= v(1)*0.1;

respNuvens= v(2)*0.3;

respChuva= v(3)*0.5;

for i=2:31

    v= T*v;

    respSol= respSol+(v(1)*0.1);

    respNuvens= respNuvens+(v(2)*0.3);

    respChuva= respChuva+(v(3)*0.5);

end



prob = round(respSol+respNuvens+ respChuva)



