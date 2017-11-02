% Get_Total_Dist
% Get the total traveling distance through point

function result=Get_Total_Dist(point)
n=size(point,1);
result=0;
for i=1:n-1
    result=result+sqrt((point(i,1)-point(i+1,1))^2+(point(i,2)-point(i+1,2))^2);
end
