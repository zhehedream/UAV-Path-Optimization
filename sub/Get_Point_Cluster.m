% Get_Point_Cluster
% Get Point sets which each point (p0) in this set meets 
% the condition with other points (px) that Euclidean_distance(p0,px)<distance
%
% Input: A
%        point vector that has the coordinates of all the points
% Input: distance
% Output: point_cluster

function point_cluster=Get_Point_Cluster(A,distance)
n=size(A,1);
V=1:1:n;
point_cluster=cell(10000,1);
num=0;
DIS=zeros(n,n);
for i=1:n
    for j=1:n
        DIS(i,j)=sqrt((A(i,1)-A(j,1))^2+(A(i,2)-A(j,2))^2);
    end
end
for i=2:n
    tmp=nchoosek(V,i);
    for j=1:size(tmp,1)
        tmp2=tmp(j,:);
        f=1;
        for k=1:i-1
            if f==0
                break;
            end
            for l=k+1:i
                if DIS(tmp2(k),tmp2(l))>distance
                    f=0;
                    break;
                end
            end
        end
        if f==1
            num=num+1;
            point_cluster{num,1}=tmp2;
        end
    end
end
point_cluster=point_cluster(1:num,:);