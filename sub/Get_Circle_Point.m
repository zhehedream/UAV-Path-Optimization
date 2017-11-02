% Get_Circle_Point
% Get (point coordinate) * n on Circle(x,y,r)
% Input: x,y
%        Center coordinate
% Input: r
%        Radius
% Output: point
%         matrix of point coordinates on Circle
%
% Example:
% >>Get_Circle_Point(0,0,1,3)
% ans =   
%    1.0000         0
%   -0.5000    0.8660
%   -0.5000   -0.8660

function point=Get_Circle_Point(x,y,r,n)
st=2*pi/n;
dt=0;
point=[];
while dt<2*pi
    dx=r*cos(dt)+x;
    dy=r*sin(dt)+y;
    point=[point;dx dy];
    dt=dt+st;
end
