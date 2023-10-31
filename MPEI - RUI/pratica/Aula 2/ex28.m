k = 0;
lameda = 0.02*100;

a = 0;
for k=0:1
a = a+ ((lameda^k)/factorial(k)*exp(-lameda))
end

