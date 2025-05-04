function [] = test3()
fprintf("------------ algebraiczna krotnosc vs geometryczna krotnosc---------------------\n")
disp("tol: 10^-9")
disp("MaxIter: 10^5")

fprintf("\n\n\n")

J = [1 0; -1 1];
B = [1 0 2; -1 1 3; 0 0 2];
disp("test 1")
fprintf("\n")
disp(J)
test = [1, 1];
disp("Oczekiwane:")
disp(test);
disp("Oszacowane:: ")
test = P2Z03_KBU_eigenvalues(J, 10^-9, 10^5);
disp(test)

fprintf("\n\n\n")
pause
disp("test 2")
fprintf("\n")
disp(B)
test = [2, 1, 1];
disp("Oczekiwane:")
disp(test);
test = P2Z03_KBU_eigenvalues(B, 10^-9, 10^5);
disp("Oszacowane: ")
disp(test)
end

