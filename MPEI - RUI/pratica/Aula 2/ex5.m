% a = (rand(2, 10000)*6)+1;
% a = int16(a);
a = randi(6, 2, 100000);
tic
aux = 0;
for i=1:100000
  if (a(1, i)+a(2, i)) == 9  
    aux = aux+1;
  end
end

aux/100000 
toc
tic
sum(sum(a) == 9)/100000
toc




b = (rand(2, 10000)*6)+1;
b = int16(b);
tic
aux2 = 0;
for i=1:10000
  if rem(b(2, i), 2) == 0 
    aux2 = aux2+1;
  end
end

aux2/10000

toc

tic
sum(rem(b(2, :), 2) == 0)/10000
toc







c = (rand(2, 10000)*6)+1;
c = int16(c);

c = sum(c == 5);
c = sum(c >= 1);
c/10000



d = (rand(2, 10000)*6)+1;
d = int16(d);
d = sum(d ~= 1);
d = sum(d >= 1);
d/10000

