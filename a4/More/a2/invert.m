function [X,condX,pvt] = invert(n,A) 
[A1,condA,pvt] = decomp(A)

X = eye(n); 
for i = 1:n 
X(:,i) = solve(A1,X(:,i),pvt); 
end 
condX = cond(X); 