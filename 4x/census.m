function  [T] = census(year,pop)
vm1 = vander(year);
A1 = fliplr(vm1); 
con1 = cond(A1,2);
vm2 = vander(year - 1900);
A2 = fliplr(vm2); 
con2 = cond(A2,2);
vm3 = vander(year - 1935);
A3 = fliplr(vm3); 
con3 = cond(A3,2);
vm4 = vander((year-1935)/35);
A4 = fliplr(vm4); 
con4 = cond(A4,2);

[A11,condA,pvt] = decomp(A1)
coef1 = solve(A11,pop,pvt);
er1 = zeros(8,1);
for i=1:8
    v=0;
    for j=8:-1:1
        v=v*(year(i))+coef1(j);%coef2 is the solution of solve.m
    end    
    er1(i)=(v-pop(i))/pop(i); %pop is the vector of the population data
end
er1max=max(abs(er1(:)));

[A22,condA,pvt] = decomp(A2)
coef2 = solve(A22,pop,pvt);
er2 = zeros(8,1);
for i=1:8
    v=0;
    for j=8:-1:1
        v=v*(year(i)-1900)+coef2(j);%coef2 is the solution of solve.m
    end    
    er2(i)=(v-pop(i))/pop(i); %pop is the vector of the population data
end
er2max=max(abs(er2(:)));

[A33,condA,pvt] = decomp(A3)
coef3 = solve(A33,pop,pvt);
er3 = zeros(8,1);
for i=1:8
    v=0;
    for j=8:-1:1
        v=v*(year(i)-1935)+coef3(j);%coef2 is the solution of solve.m
    end    
    er3(i)=(v-pop(i))/pop(i); %pop is the vector of the population data
end
er3max=max(abs(er3(:)));

[A44,condA,pvt] = decomp(A4)
coef4 = solve(A44,pop,pvt);
er4 = zeros(8,1);
for i=1:8
    v=0;
    for j=8:-1:1
        v=v*((year(i)-1935)/35)+coef4(j);%coef2 is the solution of solve.m
    end    
    er4(i)=(v-pop(i))/pop(i); %pop is the vector of the population data
end
er4max=max(abs(er4(:)));

table 

T = table([1; 2; 3; 4],[con1; con2; con3; con4],[er1max; er2max; er3max; er4max]);
T.Properties.VariableNames = {'Function','Condition','RelativeError'};
end