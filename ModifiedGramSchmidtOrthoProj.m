function Q = ModifiedGramSchmidtOrthoProj(A)
    [m,n]=size(A);
    Q = zeros(m,n);
    w1 = A(:,1);
    Q(:,1) = w1/norm(w1);
    I = eye(n);
    for j = 1:n
        W = I;
        for k = 1:j-1
            Pk = Q(:,k)*Q(:,k)';
            W = W * (I-Pk);
        end
        Q(:,j) = W*A(:,j);
        Q(:,j) = Q(:,j)/norm(Q(:,j));
    end
end