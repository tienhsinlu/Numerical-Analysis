% Gauss-Seidel Loop

function [u,k]=GaussSeidel_Loop(u_init,f,h)
n = sqrt(size(f,1));
U = reshape(u_init,n,n);
F = reshape(f,n,n);
Error = zeros(n);
Unew = U;
k = 1;
while k < 1e6
    for i=2:n-1
        for j =2:n-1
            Unew(i,j) = (1/4)*(-h^2*F(i,j)+Unew(i-1,j)+U(i+1,j)+...
                Unew(i,j-1)+U(i,j+1));
            Error(i,j) = (1/h^2)*(U(i-1,j)+U(i+1,j)+U(i,j-1)...
                +U(i,j+1)-4*U(i,j))-F(i,j);
        end
    end
    if norm(Error(:))<0.001*h^2
        break
    end
    k = k+1;
    U = Unew;
end
u = U(:);
end