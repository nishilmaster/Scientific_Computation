t = [x y z];
for i = 1:20
x = 2+(1.0/8^i);
y = atan(x)-atan(2);
z = (y*(8^(i)));
b = [x y z]; 
t = [t;b];
end
display(t);
%Nishil Master, 400020869