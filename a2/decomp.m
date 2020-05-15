function  [A,condA,pvt] = decomp(A)
n = length(A);
l = 1:n; % pvt array 
s = 1:n; 
for i = 1:n 
    l(i) = i;
    smax = 0; 
    for j = 1:n
        smax = max(smax, abs(A(i,j))); % max value in each column 
    end 
 s(i) = smax; %array with max column value 
end 
display(s);
for k = 1:(n-1)
    rmax = 0;
    for i = k:n
        r = abs(A(l(i),k)/s(l(i))) ; 
        if (r > rmax) 
            rmax = r; 
            j = i; 
            display(rmax);
        end
    end 
    % swap elements in the l array 
    temp1 = l(k);
    l(k) = l(j);
    l(j) = temp1;
    for i = (k+1):n
        xmult = A(l(i),k)/A(l(k),k);
        A(l(i),k) = xmult;
        for j = (k+1):n
            A(l(i),j) = A(l(i),j)-(xmult)* A(l(k),j);
        end
    end
end

L = eye(n) + tril(A,-1); 
U = triu(A);
pvt = l; 
condA = cond(A); 
end

