function x = solve(A,b,l)
n = length(A);
for k = 1:(n-1) 
    for i = (k+1):n
        b(l(i)) = b(l(i)) - (A(l(i),k))*(b(l(k)));
    end 
end 
x(n) = b(l(n))/A(l(n),n); 
for i = (n-1):-1:1
    sum = b(l(i));
    for j = (i+1):n
        sum = sum - (A(l(i),j))*(x(j));
    end 
    x(i) = sum/(A(l(i),i))
end 

