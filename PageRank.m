function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
    fileId = fopen(nume, "r");
    N = fscanf(fileId, "%d", 1);
    for i=0:N
        a = fgetl(fileId);
    end
    val1 = fscanf(fileId, "%f", 1);
    val2 = fscanf(fileId, "%f", 1);
    
    fclose(fileId);
    
    PR1 = Iterative(nume, d, eps);
    PR2 = Algebraic(nume, d);
    
    fileId = fopen(nume + ".out", "w");
    fprintf(fileId, "%d\n", N);
    fprintf(fileId, "%f\n", PR1(:));
    fprintf(fileId, "\n");
    fprintf(fileId, "%f\n", PR2(:));
    
    fclose(fileId);
end
