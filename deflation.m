function [result] = deflation(B, eigenvector)
% zadanie 03
% projekt 2
% Autor: Konrad Burdach, 333183
%
% OPIS:
%   Wykonuje kork deflacji w celu otrzymania macierzy o mniejszym rozmiarze i
%   bez wartosci wlasnej wyznaczanej przez eigenvector.
%
% WEJSCIE:
%   B           - macierz, którą chcemy poddać deflacji
%   eigenvector - wektor własny macierzy B
% WYJSCIE:
%   result      - macierz wynikowa po zastosowaniu transformacji P do B,
%                 obliczana zgodnie z formułą: RESULT = P * B * P'

% Pętla po współrzędnych wektora własnego
for i = 2:length(B)


    % Obliczenie wartości r jako dwuelementowego wektora [eigenvector(1), eigenvector(i)]
    if (eigenvector(i) == 0 && eigenvector(1) == 0)
        continue
    end

    if(abs(eigenvector(i)) >= abs(eigenvector(1)))
        r = -eigenvector(1)/eigenvector(i);
        s = 1 / sqrt(1 + r^2);
        c = s * r;

        % "Aktualizacja" wektora własnego po obrocie 
        eigenvector(1) = -eigenvector(i)/s;
    else
        r = -eigenvector(i)/eigenvector(1);
        c = 1 / sqrt(1 + r^2);
        s = c * r;

        % "Aktualizacja" wektora własnego po obrocie
        eigenvector(1) = eigenvector(1)/c;
    end

    % zapisanie, gdyż zmieniamy wartosci podczas mnożenia
    row1 = B(1, :);

    % Obrót givensa miedzęy 1 i i współrzędna <-> przemnożenie B prez G 1,i
    % z lewej strony
    for j = 1:length(B)
        B(1, j) = c * B(1, j) + (-s) * B(i, j);     
        B(i, j) = s * row1(j) + c * B(i, j);
    end

    % zapisanie, gdyż zmieniamy wartosci podczas mnożenia
    col1 = B(:, 1);

    % przemnożenie B prez (G 1,i)^T z prawej strony
    for j = 1:length(B)
        B(j, 1) = c * B(j, 1) + -s * B(j, i);     
        B(j, i) = s * col1(j) + c * B(j, i);
    end

end

% zapisanie odpowiedzi
result = B;

end % function
