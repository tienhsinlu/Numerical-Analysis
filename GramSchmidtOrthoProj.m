function Q = GramSchmidtOrthoProj(A)
    [m,n]=size(A);
    Q = zeros(m,n);
    w1 = A(:,1);
    Q(:,1) = w1/norm(w1);
    P = eye(n);
    for j = 1:n
        for k = 1:j-1
            Pk = Q(:,k)*Q(:,k)';
            P = P - Pk;
        end
        Q(:,j) = P*A(:,j);
        Q(:,j) = Q(:,j)/norm(Q(:,j));
    end
end