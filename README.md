# PageRank - Numerical Methods - Project 1

A pdf with the detailed description can be found in the repo.

#

For the algorithms, I used the formulas presented in the given sources.

For the iterative algorithm, I used the PR method in which I calculate each element in the vector based on the sum of the inbound elements. L(i) used in the formula represents the number of outbound connections of that node.

For the algebraic algorithm, I used the modified Gram Schmidt algorithm for QR decomposition. Based on this decomposition, I calculated the inverse of the K matrix which has the number of outbound connections at that index on the main diagonal.

I calculated M^ and iterated until a maximum iteration.

Reading was done by loading the entire file into a vector and taking values from it element by element.

In order to make the u function continuous, I calculated a and b in such a way that the lateral limits at x = val1 and val2 are equal.

The Modified Gram Schmidt algorithm is the one I made in the laboratory.

For testing, I used the examples given in the file with the requirements.
