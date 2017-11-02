% Get_Plane_Time
% Input: point
%        Coordinate of start station
% Input: rp
%        Coordinates of radars
% Output: total_time
% Output: rad_time
%         total time that plane is in radar scale

function [rad_time,total_time]=Get_Plane_Time(point,rp)

time_t=0;
step=0.01;
dd=30/720;

rt=0;
rad_time=0;
%while ~is_my_empty(rp)
while find(rp+1000~=0)
    time_t=time_t+step;
    [x,y,n]=Get_Plane_Point_After_Road(point,time_t,300);
    if x==-1000
        break;
    end
    if rp(n,1)~=1000
        rt=rt+step;
        if rt>=dd
            rt=0;
            rp(n,:)=[-1000 -1000];
        end
    end
    if Is_Plane_In_Radar(rp,[x y],70)==1
        rad_time=rad_time+step;
    end
end
total_time=time_t;


