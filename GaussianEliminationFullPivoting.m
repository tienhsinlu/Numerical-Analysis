% Problem 10.1-10 Part b
function x = GaussianEliminationFullPivoting(A,b)
[n,~]=size(A);
x = zeros(n,1);
tracking = zeros(n-1,1);
for i = 1:n-1
    [maxcol, ri] = max(abs(A(i:n,i:n)));
    [maxrow, ci] = max(maxcol);
    tracking(i)=ci;
    if abs(A(i,i))< maxrow
        r = ri(ci)+i-1;
        c = ci+i-1;
        A(:,[i,c]) = A(:,[c,i]);
        A([i,r],:) = A([r,i],:);
        b([i,r]) = b([r,i]);
    end
    m = -A(i+1:n,i)/A(i,i);
    A(i+1:n,:) = A(i+1:n,:)+ m*A(i,:);
    b(i+1:n) = b(i+1:n)+m*b(i);

end
x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end
for j=n-1:-1:1
    t = tracking(j);
    x([j+t-1,j]) = x([j,t+j-1]);
end
end