function [Q,R] = mgs(A)

    n = size(A,2);
    Q = A;
    R = zeros(n,n);

    for i=1:n
        R(i,i) = norm(Q(:,i));
        Q(:,i) = Q(:,i)./R(i,i);
        for j = i+1:n
            R(i,j) = ctranspose(Q(:,i))*Q(:,j);
            Q(:,j) = Q(:,j) - R(i,j) * Q(:,i);
        end
    end

end