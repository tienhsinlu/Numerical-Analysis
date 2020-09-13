function[Q,R]= qr_Givens(H)
    [~,n] = size(H);
    Q = eye(n);
    for i=1:n-1
            w = H(:,i);
            c = w(i)/sqrt(w(i)^2+w(i+1)^2);
            s = w(i+1)/sqrt(w(i)^2+w(i+1)^2); 
            G = [c,s;-s,c];
            H(i:i+1,i:end)=G*H(i:i+1,i:end);
            Q(1:i+1,i:i+1)=Q(1:i+1,i:i+1)*G';
    end
    R = H;
end