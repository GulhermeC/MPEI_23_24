% function to estimate the probability of the sample space for the
% following number of throws: 20, 40 and 100

% throws = 20
total20 = zeros(0,20);
x = 0:1:20;

for i=0 : 1 : 20
    fprintf('var20 = %d ', i);
    total20(i+1) = tails(0.5, 20, i, 1e5);
end

stem(x,total20);

% throws = 40
total40 = zeros(0,40);
y = (0:1:40);
for i=0 : 1 : 40
    fprintf('var40 = %d ', i);
    total40(i+1) = tails(0.5, 40, i, 1e5);
end

stem(y,total40);

% throws = 100
total100 = zeros(0,100);
z = (0:1:100);
for i=0 : 1 : 100
    fprintf('var100 = %d ', i);
    total100(i+1) = tails(0.5, 100, i, 1e5);
end
stem(z,total100);