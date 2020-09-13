% Problem 10.1-9 
% Gaussian Elimination with no pivioting (1)
function x = GaussianElimination1(A,b)
[n,~]=size(A);
x = zeros(n,1);
for i = 1:n-1
    m = -A(i+1:n,i)/A(i,i);
    A(i+1:n,:) = A(i+1:n,:)+m*A(i,:);
    b(i+1:n) = b(i+1:n)+m*b(i);
end
x(n) = b(n)/A(n,n);
for j = n-1:-1:1
    x(j) = (b(j) - A(j,j+1:n)*x(j+1:n))/A(j,j);
end
end