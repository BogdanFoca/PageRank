function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    fileID = fopen(nume, 'r');
    A = fscanf(fileID, '%f');
    fclose(fileID);
    fp = 1;
    N = A(fp);  %citire numar de noduri
    fp = fp + 1;
    M = zeros(N, N);
    for i = 1:N  %citire lista de adiacenta
        node = A(fp);
        fp = fp + 1;
        nr = A(fp);
        fp = fp + 1;
        K(i, i) = nr;
        for j = 1:nr  %citire adiacente
            k = A(fp);
            fp = fp + 1;
            if node ~= k
                M(node, k) = 1;
            end
        end
    end
    
    Mm = (PR_Inv(K) * M)';  %calcul M
    last_R = ones(N, 1) / N;  %R initial
    E = ones(N);
    new_R = (d * Mm + (1 - d) * E / N) * last_R;
    
    k=0;
    %cat timp nu a ajuns la iteratia maxima
    while k <= N
       last_R = new_R;  %R devine ultimul R
       new_R = (d * Mm + (1 - d) * E / N) * last_R;  %recalculare R
       k = k + 1;
    end
    R = new_R;
end
