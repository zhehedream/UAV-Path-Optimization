function [result,p]=Calc_Rad_Destroy(point,n,rp)
point_tmp={};
min_rd=1e12;
min_p=[];
for i=1:size(point,1)
    point_tmp=[point_tmp;Get_Circle_Point(point(i,1),point(i,2),30,n)];
end
point_index_list=Get_NL(n,size(point,1));
for i=1:size(point_index_list,1)
    temp=[];
    for j=1:size(point_index_list,2)
        index=point_index_list(i,j);
        temp_list=point_tmp{j};
        x=temp_list(index,1);
        y=temp_list(index,2);
        temp=[temp;x y];
    end
    [rd,~]=Get_Plane_Time(temp,rp);
    if rd<min_rd
        min_rd=rd;
        min_p=temp;
    end
end
p=min_p;
result=min_rd;


function result=Get_NL(n,l)
if l==1
    result=1:1:n;
    result=result';
else
    result_tmp=Get_NL(n,l-1);
    result=[];
    for i=1:n
        tmp=[ones(size(result_tmp,1),1)*i result_tmp];
        result=[result;tmp];
    end
end