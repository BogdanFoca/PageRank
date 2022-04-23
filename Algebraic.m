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
    N = A(fp);
    fp = fp + 1;
    M = zeros(N, N);
    for i = 1:N
        node = A(fp);
        fp = fp + 1;
        nr = A(fp);
        fp = fp + 1;
        K(i, i) = nr;
        for j = 1:nr
            k = A(fp);
            fp = fp + 1;
            if node ~= k
                M(node, k) = 1;
            end
        end
    end
    
    Mm = (PR_Inv(K) * M)';
    last_R = ones(N, 1) / N;
    E = ones(N);
    new_R = (d * Mm + (1 - d) * E / N) * last_R;
    
    k=0;
    while k <= N
       last_R = new_R;
       new_R = (d * Mm + (1 - d) * E / N) * last_R;
       k = k + 1;
    end
    R = new_R;
end
