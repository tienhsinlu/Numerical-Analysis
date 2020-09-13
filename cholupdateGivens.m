% Homework 8 Problem 4
function G_update = cholupdateGivens(G,z)
    n = size(G,1);
    G_update = G';
    G_update = [G_update ; z'];
    for i = 1:n
        w = G_update(:,i);
        c = w(i)/sqrt(w(i)^2+w(end)^2);
        s = w(end)/sqrt(w(i)^2+w(end)^2);
        Givens = eye(n+1);
        Givens(i,i)=c;
        Givens(i,end)=s;
        Givens(end,i)=-s;
        Givens(end,end)=c;
        G_update = Givens*G_update;
    end
    G_update = G_update(1:n,:);
end