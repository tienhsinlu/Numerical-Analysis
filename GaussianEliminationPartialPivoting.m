% Problem 10.1-10 Part a
function x = GaussianEliminationPartialPivoting(A,b)
[n,~]=size(A);
x = zeros(n,1);
for i = 1:n-1
    [pivot,j] = max(abs(A(i,:)));
    if A(i,i)<pivot
        A([i,j],:) = A([j,i],:);
        b([i,j]) = b([j,i]);
    end
    m = -A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n)+m*A(i,i+1:n);
    b(i+1:n) = b(i+1:n)+m*b(i);
end
x(n) = b(n)/A(n,n);
for j = n-1:-1:1
    x(j) = (b(j) - A(j,j+1:n)*x(j+1:n))/A(j,j);
end
end