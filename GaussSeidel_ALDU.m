% Gauss-Seidel A,L,D,U
function [x,k] = GaussSeidel_ALDU(A,b,x0)
x = x0;
x_new = x0;
k = 1;
while k<10000
    LD = tril(A);
    U = triu(A,1);
    x_new = LD\(-U*x+b);
    if norm(x_new-x)<10e-16
        break
    end
    k = k+1;
    x = x_new;
end
    
end
%     for j = 1:n
%         sum = 0;
%         for k = 1:n
%             if k~=j
%                 sum = sum +A(j,k)*x(k);
%             end
%         end
%         x_new(j) = (b(j)-sum)/A(j,j);
%     end
