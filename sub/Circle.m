% Circle
% Draw a circle as you want
% Input: fig_num
%        The figure id of the window you want to overly
% Input: R
%        radius
% Input: rx, ry
%        center coordinate

function Circle(fig_num,R,rx,ry)
figure(fig_num);
alpha=0:pi/50:2*pi;
x=R*cos(alpha)+rx; 
y=R*sin(alpha)+ry; 
plot(x,y,'r-') 
axis equal