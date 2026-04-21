clear all;
clc;
N = input("Enter the size: ");
count = 0;
%toss = round(toss);
toss = rand(N, 10);

for i = 1:N
    heads = 0;
    for j = 1:10
        if (toss(i,j) >= 0.5)
            %result = 1;
            heads = heads + 1;
        end
    end
    if heads == 3
        count = count + 1;
    end
end

prob = count/N;
fprintf('The probability of 3 heads is %f\n', prob);