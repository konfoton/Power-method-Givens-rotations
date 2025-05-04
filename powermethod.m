function [eigenvalue, eigenvector, status] = powermethod(A, tol, maxIter)
% zadanie 03
% projekt 2
% Autor: Konrad Burdach, 333183
%
% Opis: 
%   Funkcja implementuje metodę potęgową (power method) w celu wyznaczenia 
%   największej (w sensie modułu) wartości własnej macierzy `A` oraz odpowiadającego
%   jej wektora własnego.
%
% WEJŚCIE:
%   A       - macierz kwadratowa, dla której szukamy największej wartości własnej
%   tol     - tolerancja błędu przy zbieżności (warunek zakończenia iteracji)
%   maxIter - maksymalna liczba iteracji
%
% WYJŚCIE:
%   eigenvalue  - największa wartość własna macierzy `A`
%   eigenvector - odpowiadający wektor własny
%   status      - wskaźnik statusu (0: sukces, 1: niepowodzenie)

% Inicjalizacja statusu jako 1 (domyślnie oznaczającego niepowodzenie)
status = 1;

% Inicjalizacja losowego wektora startowego `x`
x_1 = rand(length(A), 1);

% Normalizacja wektora początkowego
x_1 = x_1 ./ norm(x_1);


for i = 1:maxIter

    x_2 = A * x_1;

    % Sprawdzenie czy wektor zerowy aby zapobiec dzielniu przez zero i
    % koniec spowodowany zerowa wartoscia wlasna
    if sum(abs(x_2)) == 0
        eigenvalue = 0;
        eigenvector = 0;
        status = 2;
        return
    end

    x_2 = x_2 ./ norm(x_2);

    % Znalezienie elementów o największej wartości bezwzględnej w wektorach
    % 'x_1'
    [~, index1] = max(abs(x_1));

    % Sprawdzenie warunku zbieżności:
    % Jeżeli różnica wektorów jest mniejsza od `tol`, metoda zbiega
    if (norm(sign(x_2(index1)) * x_2 - sign(x_1(index1)) * x_1) < tol)
        status = 0;
        break 
    end
    
    % Aktualizacja wektorów w celu przejścia do kolejnej iteracji
    x_1 = x_2;                 
end

    % Wyznaczenie wektora własnego jako `x_2`
    eigenvector = x_2;
 
    % Wyznaczenie wartości własnej za pomocą iloczynu `x_2' * A * x_2`
    eigenvalue = x_2' * A * x_2;

end % function
