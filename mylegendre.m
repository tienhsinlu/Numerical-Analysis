function pnx = mylegendre(n, x) % (1)
% input: n = degree of Legendre polynomial
% x = evaluate it at these points
% output: pnx = P_n(x)
pkm1 = ones(size(x)); % (2)
pk = x; % (3)
if n == 0 % (4)
pnx = pkm1; % (5)
return % (6)
elseif n == 1 % (7)
pnx = pk; % (8)
return % (9)
end % (10)
for k = 1:n-1 % (11)
pkp1 = ( (2*k + 1)*x.*pk - k*pkm1 )/(k + 1); % (12)
pkm1 = pk; % (13)
pk = pkp1; % (14)
end % (15)
pnx = pkp1; % (16)
end % (17)