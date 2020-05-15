function [output1,output2,output3a,output3b,output4a,output4b,output5a,output5b,outputrandoma,outputrandomb] = testinvert(A2,n)
A2 = [2,3;3,4] 
% To run it, enter: [output1,output2,output3a,output3b,output4a,output4b,output5a,output5b,outputrandoma,outputrandomb] = testinvert(A2,2)
% Inverse of A2 -> X = [-4,3;3,-2] 
%output 1 = |Z-A| = 0 
% output 2 = |AX - I| = 0 
[X,condX,pvt] = invert(n,A2);
[Z,condY,pvty] = invert(n,X);
output1 = eye(n);
output2 = eye(n); 
identity = eye(n); 
for i = 1:n 
    for j = 1:n 
        output1(i,j) = abs(Z(i,j)-A2(i,j)); 
    end 
end
output2 = abs(A2 * X - identity) ;

A3 = [2,3,5;3,4,5;3,4,4] 
n3 = 3;
% Inverse of A3 -> X = [-4,8,-5;3,-7,5;0,1,-1] 
%output 1 = |Z-A| = 0 
% output 2 = |AX - I| = 0 
[X,condX,pvt] = invert(n3,A3);
[Z,condY,pvty] = invert(n3,X);
output3a = eye(n3);
output3b = eye(n3); 
identity = eye(n3); 
for i = 1:n3 
    for j = 1:n3 
        output3a(i,j) = abs(Z(i,j)-A3(i,j)); 
    end 
end
output3b = abs(A3 * X - identity) ;



A4 = [2,3,4,3;5,4,3,2;4,5,6,5;4,3,4,3];
n4=4;
%output 1 = |Z-A| = 0 
% output 2 = |AX - I| = 0 
[X,condX,pvt] = invert(n4,A4);
[Z,condY,pvty] = invert(n4,X);
output4a = eye(n4);
output4b = eye(n4); 
identity = eye(n4); 
for i = 1:n4 
    for j = 1:n4
        output4a(i,j) = abs(Z(i,j)-A4(i,j)); 
    end 
end
output4b = abs(A4 * X - identity) ;

A6 = rand(4,4);
%output 1 = |Z-A| = 0 
% output 2 = |AX - I| = 0 
[X,condX,pvt] = invert(n4,A6);
[Z,condY,pvty] = invert(n4,X);
output5a = eye(n4);
output5b = eye(n4); 
identity = eye(n4); 
for i = 1:n4 
    for j = 1:n4
        outputrandoma(i,j) = abs(Z(i,j)-A6(i,j)); 
    end 
end
outputrandomb = abs(A6 * X - identity) ;

A5 = [1,1,1,1,1;0,4,5,3,2;0,4,0,2,1;5,6,7,0,3;2,3,1,2,3];
n5=5;
%output 1 = |Z-A| = 0 
% output 2 = |AX - I| = 0 
[X,condX,pvt] = invert(n5,A5);
[Z,condY,pvty] = invert(n5,X);
output5a = eye(n5);
output5b = eye(n5); 
identity = eye(n5); 
for i = 1:n5 
    for j = 1:n5
        output5a(i,j) = abs(Z(i,j)-A5(i,j)); 
    end 
end
output5b = abs(A5 * X - identity) ;


end