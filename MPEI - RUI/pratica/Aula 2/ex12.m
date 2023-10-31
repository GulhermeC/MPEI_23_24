N = 1e6;
n = 20;
m = 100;
experinc = randi(m, n, N);


aux1 = 0;

for i=1:N
    if length(unique(experinc(:,i))) == n
    aux1 = aux1 +1;

    end
end



a = aux1/N




aux2 = 0;

for i=1:N
    if length(unique(experinc(:,i))) <= n-2
        aux2 = aux2+1;
    end

    
end




aux1 = 0;
a = [];
for i=1:N
    if length(unique(experinc(:,i))) <= n-2
    aux1 = aux1 +1;

    end
    a(i) = aux1/i;

end

b = plot(1:N, a)





