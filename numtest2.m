function [] = numtest2()
disp("zmiana stosunku niezerowych elementów do wszystkich przed i po deflacji")
disp("Macierz 100x100")
A = zeros(100, 100);
K = randperm(100);
J = randperm(100);
for i = 1:100
    z = rand(1);
    A(K(i), J(i)) = z;
    A(J(i), K(i)) = z;
end
[K M] = eig(A);
ratio = 1 - (sum(sum(A == 0)))/10000;
disp("Przed:");
disp(ratio);
A = deflation(A, K(:, 1));
ratio = 1 - (sum(sum(A == 0)))/10000;
disp("Po:");
disp(ratio);
disp("Macierz 1000x1000")
A = zeros(1000, 1000);
K = randperm(1000);
J = randperm(1000);
for i = 1:1000
    z = rand(1);
    A(K(i), J(i)) = z;
    A(J(i), K(i)) = z;
end
[K M] = eig(A);
ratio = 1 - (sum(sum(A == 0)))/1000000;
disp("Przed:");
disp(ratio);
A = deflation(A, K(:, 1));
ratio = 1 - (sum(sum(A == 0)))/1000000;
disp("Po:");
disp(ratio);

