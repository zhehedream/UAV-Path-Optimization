% Get_Group_Dist
% Get the Distance_Matrix of group A

function group_dist=Get_Group_Dist(A)
n=size(A,1);
group_dist=zeros(n,n);
for i=1:n
    for j=1:n
        if i==j
            group_dist(i,j)=0;
        else
            group_dist(i,j)=sqrt((A(i,1)-A(j,1))^2+(A(i,2)-A(j,2))^2);
        end
    end
end
