clc


fprintf("1) \n\n")
fprintf("First, we initiliaze the matrix A and the matrix b. \n")
A = [2 -1 0 1 0;-4 3 0 -5 -4;5 -2 3 1 -1;-6 2 0 -4 -2;2 -1 0 1 0]
b = [1;5;-3;2;3]
fprintf("(1) \n")
fprintf("Then, we use the command  c = poly(A), which gives us the characteristic polynomial of A. And the result is the coefficients of the powers of \x03bb in decending order stored as 1D array at C\n")
c = poly(A)
fprintf("Now, the characteristic polynomials in terms of \x03bb looks like this: \n \x03bb^5-4\x03bb^4-1\x03bb^3+16\x03bb^2-12\x03bb-0 \n")
fprintf("(2) \n")
fprintf("We use the command polyval(c, 5) to find the value of the characterisitic polynomial at \x03bb = 5 and the rounded answer is")
round(polyval(c, 5))
fprintf("Since, the value of characterisitic polynomial at \x03bb=5 is not 0. It is not an eigen value. \n")
r = roots(c);
fprintf("(3)\n")
fprintf("We find the roots of  the characteristic polynomial of A. In this case, we use roots function on c like this, roots(c) \n. The roots of the polynomial is:")
r = round(r)
fprintf("Since, these are the roots of the characteristic polynomial of A. These are the eigen values associated with A.\n")
fprintf("We can check the answer using matrix A by solving det(A-\x03bbIn). If the value is 0, then it is an eigen value. For instance, take \x03bb= -2.\n We use >>round(det(A- r(1)*eye(size(A)))) command to check the answer\n")
round(det(A- r(1)*eye(size(A))))
fprintf("(4)\n")
fprintf("Now, we use the command >>[V,D] = eig(A) to get eigen vectors and corresponding eigen values.\n")
fprintf("This displays 2 matrices. The column vectors in the first matrix V are the eigen vectors.\n")
fprintf("The diagonal entries of the second matrix (D) are the eiegen values associated in order with eigen vectors in matrix V.\n")
fprintf("Therefore, the columns of V and diagonal entries of D are related. They must be in the same order.\n")
[V, D] = eig(A)
fprintf("(5)\n")
fprintf("We can solve the vector equation by using the command f = inv(V)*b. The solution is:")
f = inv(V)*b
fprintf("When k = 1, A^k*b and V*D^k*f are")

A*b 
round(V * (D) * f)
fprintf("Similarly, when k = 3")
A^3*b
round(V*D^3*f)
fprintf("Similarly, when k = 6")
A^6*b
round(V*D^6*f)
fprintf("We observe that  A^k*b and V*D^k*f are the same. We can consolidate this argument by using a theorem in Linear Algebra.\n")
fprintf("According to the theorem, A^k = (V)*(D)^k * inv(V). Now, (A)^k * (b) is equal to (V) * (D)^k * inv(V) * b\n")
fprintf("Now, we know that, f = inv(V) * b. Therefore, (A)^k * b and (V) * (D)^k *(f) are the same.\n\n")
fprintf("2 \n \n")
fprintf("We initiliaze the matrix A and store it in the variable  A.\n")
A = [5 1 7 8 18 -4 2;5 9 -17 8 -38 -60 2;10 5 5 0 15 35 8;5 4 -2 7 -3 -21 0;3 1 3 1 8 10 6]
fprintf("(1)\n")
fprintf("We convert the matrix A into reduced row echelon form to find pivot positions in columns to find column space")
rref(A)

fprintf("Now, we see that The first, second, fourth, and seventh column vectors are basis for col(A)\n")
columnspace = [A(:,1) A(:, 2) A(:, 4) A(:, 7)]
fprintf("(2) \n")
fprintf("Now, solving for the null(A), we have these column vectors.\n")
nullspace = [-2 -5 -7;3 7 7;1 0 0;0 0 4;0 1 0; 0 0 1; 0 0 0]
fprintf("The number of vectors in the basis of null space can also be predicted from the echleon form of A. \n Since the number of free parameters in the reduced row echleon form is equal to the number of vectors when you solve A * x = 0\n\n")
fprintf("(3)\n")
fprintf("The sum of the dimension of the null space and the dimension of the column space is going to be equal to the number of columns of the matrix A..\n")
fprintf("This is quite evident because the dimension of column space is the number of pivot positions of equivalent matrix A converted to reduced row echleon form.\n")
fprintf("And the dimension of null space is the number of free parameters of equivalent matrix A converted to reduced row echleon form.\n ")
fprintf("And the sum of free parameters and pivot positions must be equal to the number of columns of A.\n")
fprintf("This is the consequence of the rank-nullity theorem. \n\n")
fprintf("(4) \n")
B = [A A]
fprintf("We can immediately say that A and B have the same column space because adding same column vectors is adding more linearly dependent vectors, which has no effect in column space.\n However, the null space changes because it is the set of vectors that satisfies the homogenous equation.\n And adding same column vectors means more free parameters, which means more linear combinarions for the 0 vector. Hence, it changes the null space.\n\n")
A = [5 1 7 8 18 -4 2;5 9 -17 8 -38 -60 2;10 5 5 0 15 35 8;5 4 -2 7 -3 -21 0;3 1 3 1 8 10 6];
fprintf("(5)\n")
fprintf("We find the orthonormal basis for col(A) and orthonormal basis for null space of A using orth(A) and null(A) respectively.\n")

a = orth(A)
b = null(A)
fprintf("I can say that the obtained bases are orthonormal by checking 2 things\n")
fprintf("a) The dot product of each vector in basis with another vector in basis must be equal to zero.\n b) The magnitude or normal of each vector in the basis must be equal to 1.\n")
fprintf("For instance, for orthonormal basis of col(A), we choose the first and the second column vector and do the dot product using the command round(dot(a(:,1),a(:,2)))\n")
fprintf("And the answer is: ")
round(dot(a(:, 1), a(:,2)))
fprintf("Now, we proceed to check the magnitude of the vectors. For instance, let's just check the magnitude of the first column vector of orthonormal basis of col(A) by using norm function\n.\n The answer is: ")
norm(a(:,1))

fprintf("Conclusion: This project was very helpful in understanding the concept of diagnolization, eigen space, eigen vector, column space, and null space.\n This project also exposed us to powerful functions such as poly, orth, null, eig, and so on. These functions are definitely going to be useful  in future projects.\n\n\n")

