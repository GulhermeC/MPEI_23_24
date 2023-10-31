e = 1e5;

for i=0:5
   a=(rand(5, e));
   b = sum(a > 0.3);
   c = sum(b == i);
   c/e
end


   a=(rand(5, e));
   b = sum(a < 0.3);
   c = sum(b >= 2);
   c/e
