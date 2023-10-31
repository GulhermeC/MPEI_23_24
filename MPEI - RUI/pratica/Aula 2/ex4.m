n = 3;
a = (rand(n, 1e6)*365)+1;
a = int16(a);
aux = 0;
l = 0;
while l <0.5
for i=1:1e6
     if length(unique(a(:,i))) ~= n
          aux = aux+1;
           
    end
end
l = aux/(1e6)

end
