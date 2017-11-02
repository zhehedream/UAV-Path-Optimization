% Get_Points_Order
% Get the minimum point order which shows how to travel through all 
% the points to achieve the minimum distance
% Input: point
% Output: opoint
%         point order
% Output: dist
%         minimum travel distance

function [opoint,dist]=Get_Points_Order(point)
n=size(point,1);
seq=perms(1:n);
min_d=1e12;
min_index=0;
for i=1:size(seq,1)
    d=0;
    for j=1:length(seq(i,:))-1
        d=d+sqrt((point(seq(i,j),1)-point(seq(i,j+1),1))^2+(point(seq(i,j),2)-point(seq(i,j+1),2))^2);
    end
    if d<min_d
        min_d=d;
        min_index=i;
    end
end

dist=min_d;
opoint=[];
tmp=seq(min_index,:);
for i=1:length(tmp)
    opoint=[opoint;point(tmp(1,i),1) point(tmp(1,i),2)];
end