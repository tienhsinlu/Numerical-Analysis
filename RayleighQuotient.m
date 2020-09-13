% Homework 9 Problem 2

function v = RayleighQuotient(A)
    n = size(A,1);
    v = rand(n,1);
    lambda = v'*A*v;
    w = (A-lambda*eye(n))\v;
    v = w/norm(w);
    lambda = v'*A*v;
    error = norm(A*v-lambda*v)
    
    while error > 10e-8
        w = (A-lambda*eye(n))\v;
        v = w/norm(w);
        lambda = v'*A*v;
        error = norm(A*v-lambda*v)
    end

end