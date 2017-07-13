function [Q,R] = gs(A)

    n = size(A,2);
    m = size(A,1);

    Q = zeros(m,n);
    R = zeros(n,n);

    for i=1:n
        v = A(:,i);
        for j = 1 : i-1
            R(j,i) = ctranspose(Q(:,j))*A(:,i);
            v = v - R(j,i) * Q(:,j);
        end
        R(i,i) = norm(v);
        Q(:,i) = v./R(i,i);

    end

end