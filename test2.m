function [] = test2()

    fprintf('\n========================================\n');
    fprintf('  TEST_2\n');
    fprintf('========================================\n');

    tol     = 1e-9;
    maxIter = 30000;
    fprintf('tol: %d\n', tol);
    fprintf('maxIter: %d\n', maxIter);

    testMatrices = {
        struct('name','rand (10x10)', ...
               'A',rand(10)), ...
        struct('name','rand (100x100)', ...
               'A',rand(100)), ...
        struct('name','rand (200x200)', ...
               'A',rand(200)), ...
        struct('name','rand (300x300)', ...
               'A', rand(300)), ...
        struct('name','rand (400x400)', ...
               'A', rand(400)), ...
        struct('name','rand (500x500)', ...
               'A', rand(500)), ...
    };

    for k = 1:numel(testMatrices)
        testName = testMatrices{k}.name;
        A        = testMatrices{k}.A;
        

        tic;
        approxLambdas = P2Z03_KBU_eigenvalues(A + A', tol, maxIter);
        elapsed_time = toc;
        exactLambdas  = eig(A + A')';
        exactLambdas = sort(exactLambdas, 'descend', 'ComparisonMethod', 'abs');
        fprintf('\nTEST MACIERZY: %s\n', testName);
        
        fprintf('Upłynięty czas: %d\n\n', elapsed_time);
        disp('liczba poprawnych (eig):');
        disp(sum((abs(approxLambdas - exactLambdas(1:length(approxLambdas)))) < 10^-3));
        pause();

    end

    fprintf('\nWszysktie testy zrobione.\n');
end

