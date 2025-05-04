function [] = test1()

    fprintf('\n========================================\n');
    fprintf('  TEST_1\n');
    fprintf('========================================\n');
    symetryczna10 = rand(10)';
    symetryczna10 = symetryczna10 + symetryczna10';
    symetryczna3 = rand(3)';
    symetryczna3 = symetryczna3 + symetryczna3';
    symetryczna4 = rand(4)';
    symetryczna4 = symetryczna4 + symetryczna4';
    normalna15 = rand(15);


    tol     = 1e-9;
    maxIter = 10000;
    fprintf('tol: %d\n', tol);
    fprintf('maxIter: %d\n', maxIter);
    
    testMatrices = {
        struct('name','macierz zerowa (10x10)', ...
               'A',zeros(10)), ...
        struct('name','Identycznosciowa (4x4)', ...
               'A',eye(4)), ...
        struct('name','Diagonalna (4x4)', ...
               'A',diag([10, 3, -2, 7])), ...
        struct('name','losowa symetryczna (3x3)', ...
               'A', symetryczna3), ...
        struct('name','losowa symetryczna (4x4)', ...
               'A',symetryczna4), ...
        struct('name','Symetryczna (10x10)', ...
               'A', symetryczna10), ...
       struct('name','bliskie wartosci wlasne (2x2)', ...
       'A', diag([2, 1.9999])), ...
       struct('name', '4x4 dimker = 3, dimIm = 1','A' ,[ 1,  1  ,   1  ,   1; ...
     2  ,   2   ,  2   ,  2; ...
     3   ,  3 ,    3   ,  3; ...
     4  ,   4   ,  4   ,  4]), ...
       struct('name','Macierz nilpotentna (3x3)', 'A', [5    -3     2; 15    -9     6;10 -6 4]), ...
        struct('name','Macierz nilpotentna (4x4), taka, że B^4 = 0', 'A', [0     2     1     6;
     0     0     1     2;
     0     0     0     3;
     0     0     0     0]), ...
       struct('name','randomowa (15x15)', 'A', normalna15)
    };

    for k = 1:numel(testMatrices)
        testName = testMatrices{k}.name;
        A        = testMatrices{k}.A;
        

        tic;
        approxLambdas = P2Z03_KBU_eigenvalues(A, tol, maxIter);
        elapsed_time = toc;
        exactLambdas  = eig(A)';
        exactLambdas = sort(exactLambdas, 'descend', 'ComparisonMethod', 'abs');

        fprintf('\nTESTOWANA MACIERZ: %s\n', testName);
        
        disp('MACIERZ A:');
        disp(A);
        fprintf('Upłynięty czas: %d\n\n', elapsed_time);
        disp('Oszacowane wartosci wlasne:');
        disp(approxLambdas);
        disp('Dokładne wartosci wlasne:');
        disp(exactLambdas);
        pause();

    end

    fprintf('\nWszysktie testy zrobione.\n');
end

