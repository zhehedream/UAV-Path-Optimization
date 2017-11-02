% Is_Plane_In_Radar
% Input: point
%        Vectors of radars
% Input: p_point
%        Coordinate of plane
% Input: distance
%        Radar scanning radius
% Output: result
%        1-in_radar; 0-not_in_radar

function result=Is_Plane_In_Radar(point,p_point,distance)
for i=1:size(point,1)
    if point(i,1)==-1000
        continue;
    end
    if sqrt((p_point(1,1)-point(i,1))^2+(p_point(1,2)-point(i,2))^2)<distance
        result=1;
        return;
    end
end
result=0;