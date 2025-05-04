function [lambdas] = P2Z03_KBU_eigenvalues(A, tol, maxIter)
% zadanie 03
% projekt 2
% Autor: Konrad Burdach, 333183
%
% OPIS:
%   Proba wyliczenia kolejnych wartosci własnych metoda potegowa z użyciem
%   deflacji zaimplementowanej przy pomocy Obrotów givensa.
%
% WEJSCIE:
%   A - rzeczywista macierz kwadratowa
%   tol - dokladnosc rozwiazania
%   maxIter - maksymalna liczba iteracji
% WYJSCIE:
%   lambdas - udane wyliczone wartosci wlasne z dokładnoscia tol

lambdas = [];
size = length(A);

for i = 1:size
    
    % metoda potegowa
    [eigenvalue, eigenvector, status] = powermethod(A, tol, maxIter);
    
    % sprawdzenie czy max iteracji jezeli tak konczymy
    if status == 1
        break
    end

    % sprawdzenie czy zerowa wartosc wlasna, skoro zerowa nie ma wiekszej
    % czyli uzupelniamy do końca zerowymi
    if status == 2
        lambdas = [lambdas zeros(1, size - i + 1)];
        break
    end

    % dodanie wartosci wlasnej
    lambdas = [lambdas eigenvalue];
    
    % krok deflacji
    A = deflation(A, eigenvector);
    if length(A) >= 2
       A = A(2:end, 2:end);
    end

end % function

