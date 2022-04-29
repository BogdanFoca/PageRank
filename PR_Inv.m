function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se descompune matricea A in QR folosind Gram Schmidt modificat
    % Inversa matricei va fi R inversat * Q transpus
    % R fiind matrice triunghiulara se inverseaza foarte usor
    [Q, R] = Gram_Schmidt_Modified(A);
    
    B = inv(R) * Q';
end

function [Q, R] = Gram_Schmidt_Modified(A)
  [m, n] = size(A);
  Q = zeros(m,n);
  R = zeros(n);
  for i = 1 : n
    R(i, i) = norm(A(:, i), 2);
    Q(:, i) = A(:, i) / R(i, i);
    for j = i + 1 : n
      R(i, j) = Q(:, i)' * A(:, j);
      A(:, j) = A(:, j) - Q(:, i) * R(i, j);
    end
  end
end