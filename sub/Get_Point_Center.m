% Get_Point_Center
% Get the coordinate of the weight center

function [x,y]=Get_Point_Center(A,vec)
n=length(vec);
x=0;
y=0;
for i=1:n
    x=x+A(vec(i),1);
    y=y+A(vec(i),2);
end
x=x/n;
y=y/n;
