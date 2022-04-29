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
    N = A(fp);  %citire numar de noduri
    fp = fp + 1;
    M = zeros(N, N);
    L = zeros(N, 1);
    for i = 1:N  %citire lista de adiacenta
        node = A(fp);
        fp = fp + 1;
        nr = A(fp);
        fp = fp + 1;
        L(i, 1) = nr;
        for j = 1:nr  %citire adiacente
            k = A(fp);
            fp = fp + 1;
            if node ~= k
                M(node, k) = 1;
            end
        end
    end
    
    last_PR = ones(N, 1) / N;   %PR initial
    for i=1:N
        sum = 0;
        for j=1:N  %suma cu nodurile inbound
            if M(j, i) == 1
                sum = sum + last_PR(j) / L(j); 
            end
        end
        PR(i) = (1-d) / N + d * sum;
    end
    %cat timp nu este in limita de eroare
    while norm(last_PR - PR, 2) >= eps
        last_PR = PR;  %Pr curent devine ultimul PR
        for i=1:N  %recalcul PR
            sum = 0;
            for j=1:N
                if M(j, i) == 1
                    sum = sum + last_PR(j) / L(j);
                end
            end
            PR(i) = (1-d) / N + d * sum;
        end
    end
    R = PR;
end