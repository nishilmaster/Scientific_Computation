global  r0	   
global  c	
global M	  
global  A	   
global w	 
global  tmax     
global k
odetol = 0.01;	
r0  =  input('r0:  ');
c  =  input('c: ');	   
M = 10; A = 2; w = 7; tmax = 5; k = 640;

tspan  =  [0;  tmax];	  
y0 = [0;0];	   
%tspan = inital and final times
%y0= initial conditions
%odetol = tolerance 
[t,x]  =  ode45(@massspring,  tspan,  y0,  odetol);
%DISPLACEMENT
subplot(2,2,1), plot(t,x(:,1)) 
%ROAD CONTOUR
dxdt  =  A*(ones(size(t))  -  cos(w*t)); 
subplot(2,2,2), plot(t,dxdt)
%ACCELERATION
dxdt  =  A*(1.0  -  cos(w*t));
dx0  =  A*w*sin(w*t);
r  =  r0*(ones(size(t))  +  c*abs(x(:,2)  -  dx0));
dx2  =  -(k*(x(:,1)  -  dxdt)  +  r.*(x(:,2)  -  dx0))/M;
subplot(2,2,3), plot(t,dx2)
%DAMPING
xi  =  r/(2*sqrt(k*M));
subplot(2,2,4), plot(t,xi)

function  y1  =  massspring(t,y)    
global r0 
global c

global M

global A 
global w
global k

y1 = zeros(2,1);
y1(1)=y(2);
x0  = A*(1.0  -  cos(w*t)); 
dx0  = A*w*sin(w*t);
R  =  r0*(1.0  +  c*abs(y(2)  -  dx0));
y1(2) = -(k*(y(1)  -  x0)  +  R*(y(2) - dx0))/M;
end






