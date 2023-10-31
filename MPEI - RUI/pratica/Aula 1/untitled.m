function a = untitled(x, y, z)
b = rand(x, z);
j = sum(b > y);
a = sum(j == 1);
end



