% Homework8Problem3 part b
function x = TwoTridiagMatrixMethod(A,b)
n = size(A,1);
I = speye(n);
T = A - A(1,n)*I(:,1)*I(:,n)'-A(n,1)*I(:,n)*I(:,1)';
T = sparse(T);
l_new = A(1,n)*I(:,1)+I(:,n);
u_new = A(n,1)*I(:,1)+I(:,n);
di = zeros(1,n);
di(1) = A(1,n)*A(n,1);
di(n) = 1;
D = sparse(1:n,1:n,di,n,n);
T_new = T - D;
y = T_new\b;
z = T_new\l_new;
x = y - (A(n,1)*y(1)+y(n))/(1+A(n,1)*z(1)+z(n))*z;
end