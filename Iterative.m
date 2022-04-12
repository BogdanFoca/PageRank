function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
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
                M(k, node) = 1;
            end
        end
    end
    PR = rand(N, 1);
    PR = PR ./ norm(PR, 1);
    last_PR = ones(N, 1) * inf;
    M_hat = (d .* M) + (((1 - d) / N) .* ones(N, N));
    
    while(norm(PR - last_PR, 2) > eps)
       last_PR = PR;
       PR = M_hat * PR;
    end
    R = PR;
end