k = 0;
lameda = 15;
a = (lameda^k)/factorial(k)*exp(-lameda)

b = 0;
for k=0:10
b = b+((lameda^k)/factorial(k)*exp(-lameda))
end

1-b