clc;
clear all;

% conjunto U1 de 1000 palavras
u1 = 1000;

% conjunto U2 de 10000 palavras
u2 = 10000;

% =============================== Ex1 ================================== %
fprintf('\n =============================== Ex1 ================================== \n');
k = 3;
n = 8000;

wordpress = fopen('wordlist-preao-20201103.txt','r');
dict = textscan(wordpress,'%s');
fclose(wordpress);
dict = dict{1,1};
BF = initBloomFilter(n);

for i = 1:u1
    BF = insertBloomFilter(dict{i}, BF, k);
end

% =============================== Ex2 ================================== %
fprintf('\n =============================== Ex2 ================================== \n');

count = 0;

for i = 1:u1
    check = checkBloomFilter(dict{i}, BF, k);
    if ~check
        count = count + 1;
    end
end
fprintf('False negatives for group U1 = %d\n', count);

% =============================== Ex3 ================================== %
fprintf('\n =============================== Ex3 ================================== \n');

count2 = 0;

for i = u1+1:u1+u2
    check = checkBloomFilter(dict{i}, BF, k);
    if check
        count2 = count2 + 1;
    end
end

percent_count2 = 100*count2/u2;
fprintf('Percentage of false positives for group U2 = %.2f%%\n', percent_count2);

% =============================== Ex4 ================================== %
fprintf('\n =============================== Ex4 ================================== \n');


t_percent = 100*(1-exp(-k*u1/n))^k;
fprintf('Percentage of theoretical false positives = %.2f%%\n', t_percent);

% Compare
if percent_count2 > t_percent
    fprintf(['The percentage of false positives for group U2 (%.2f%%) ' ...
        'is higher than the theoretical percentage (%.2f%%).\n'], percent_count2, t_percent);
elseif percent_count2 < t_percent
    fprintf(['The theoretical percentage of false positives (%.2f%%) ' ...
        'is higher than that for group U2 (%.2f%%).\n'], t_percent, percent_count2);
else
    fprintf(['The percentage of false positives for group U2 and ' ...
        'the theoretical percentage are equal (%.2f%%).\n'], percent_count2);
end

% =============================== Ex5 ================================== %
fprintf('\n =============================== Ex5 ================================== \n');

% k => 4 to 10
k_values = 4:10;
percent_values = zeros(size(k_values));

for idx = 1:length(k_values)
    k = k_values(idx);

    % Init Bloom Filter
    BF = initBloomFilter(n);

    % Insert elements from U1
    for i = 1:u1
        BF = insertBloomFilter(dict{i}, BF, k);
    end

    % Count false positives from U2
    count2 = 0;
    for i = u1+1:u1+u2
        check = checkBloomFilter(dict{i}, BF, k);
        if check
            count2 = count2 + 1;
        end
    end

    percent_count2 = 100 * count2 / u2;
    fprintf('Percentage of false positives for k = %d and group U2 = %.2f%%\n', k, percent_count2);
    
    % Store percentage
    percent_values(k - 3) = percent_count2;
end

% Plot
figure;
plot(k_values, percent_values, '-o');
title('False Positive Percentage by k');
xlabel('k');
ylabel('False Positive Percentage (%)');
grid on;

% ====================================================================== %
% ======================== Funções complementares ====================== %
% ====================================================================== %

function BF = initBloomFilter(n)
    BF = false(1, n);
end

function BF = insertBloomFilter(element, BF, k)
    n = length(BF);
    for i = 1:k
        element = [element num2str(i)];
        h = DJB31MA(element, 127);

        %para dar valor entre 1 e n para por no BF
        h = mod(h, n) + 1;

        BF(h) = true;
    end
end

function check = checkBloomFilter(element, BF, k)
    n = length(BF);
    check = true;
    for i = 1:k
        element = [element num2str(i)];
        h = DJB31MA(element, 127);

        %para dar valor entre 1 e n para por no BF
        h = mod(h, n) + 1;

        if ~BF(h)
            check = false;
            break;
        end
    end
end