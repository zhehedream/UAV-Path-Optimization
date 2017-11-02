% Get_Plane_Point_After_Road
% Get the coordinate of plane after it travels through point in t with
% speed
%
% Input: point
%        points vector of Road
% Input: t_limit
%        time limit
% Input: speed
% Output: x, y
%         plane coordinate after traveling
%         (x & y==1000) means cannot finish in t_limit
% Output: n
%         retardation points amount

function [x,y,n]=Get_Plane_Point_After_Road(point,t_limit,speed)
n=1;
while t_limit>0
    n=n+1;
    if n>size(point,1)
        x=-1000;
        y=-1000;
        break;
    end
    dt=sqrt((point(n,1)-point(n-1,1))^2+(point(n,2)-point(n-1,2))^2)/speed;
    if t_limit-dt>0
        t_limit=t_limit-dt;
    else
        ll=speed*t_limit;
        xx=point(n,1)-point(n-1,1);
        yy=point(n,2)-point(n-1,2);
        mm=sqrt(xx^2+yy^2);
        xe=xx/mm*ll;
        ye=yy/mm*ll;
        x=xe+point(n-1,1);
        y=ye+point(n-1,2);
        t_limit=-1;
    end
end
n=n-1;