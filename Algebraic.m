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
        for j = 1:nr
            k = A(fp);
            fp = fp + 1;
            if node ~= k
                M(node, k) = 1;
            end
        end
    end
    
    M_t = PR_Inv(M);
    
    PR = rand(N, 1);
    PR = PR ./ norm(PR, 1);
    last_PR = ones(N, 1) * inf;
    
    while(norm(PR - last_PR, 2) > eps)
       last_PR = PR;
       PR = M_t * PR;
    end
    R = PR;
end
