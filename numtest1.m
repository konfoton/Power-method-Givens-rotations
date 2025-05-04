function [] = numtest1()
B = rand(100, 1);
C = zeros(100);
for i = 1:100
    C(i, i) = B(i);
end
V = rand(100);
Vin = inv(V);
B = V * C * Vin;
eps = 1e-9;
% iter = 1;
% exactLambdas  = eig(B)';
% exactLambdas = sort(exactLambdas, 'descend', 'ComparisonMethod', 'abs');
% diff = min(abs(1 - (abs(exactLambdas(1:end-1)) ./ abs(exactLambdas(2:end))))) + 1;
% x = [1];
% y = [];
% for i = 1:18
%     approx = P2Z03_KBU_eigenvalues(B, eps, iter);
%     m = sum(abs((exactLambdas(1:length(approx)) - approx < 1e-3)));
%     y = [y m];
%     iter = iter * 2;
%     x = [x iter];
% end
% x(1:end-1);
% y
final_x = [];
final_y = [];
V = rand(10);
Vin = inv(V);
for j = linspace(1.001, 4.5, 10)
iter = 1;
B = 1:10;
B = (j).^B;
C = zeros(10);
for i = 1:10
    C(i, i) = B(i);
end
B = V * C * Vin;
exactLambdas  = eig(B)';
exactLambdas = sort(exactLambdas, 'descend', 'ComparisonMethod', 'abs');
diff = mean(abs(exactLambdas(1:end-1)) ./ abs(exactLambdas(2:end)));
x = [1];
y = [];
for i = 1:18
    approx = P2Z03_KBU_eigenvalues(B, eps, iter);
    m = sum(abs((exactLambdas(1:length(approx)) - approx < 1e-3)));
    y = [y m];
    iter = iter * 2;
    x = [x iter];
end
final_y = [final_y; y];
end
x = log2(x(1:end-1));
hold on
for i = 1:10
    plot(x, final_y(i, :));
end
xlabel("liczba iteracji")
ylabel("liczba znalezionych")
title('wykresy dla macierzy symetrycznej 10x10 o róznych stosunkach najwiekszych co do modułu wartosci wlasnych z zakresu 1.001 do 4.5');
end