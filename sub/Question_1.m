%Question 1
Draw_Map;
data;
seq6=perms(1:6);

gd=Get_Group_Dist(A06);
%seq6
min_value=10e12;
min_index=0;
min_point=[];
for i=1:length(seq6)
    [result6,point6]=Get_Travel_Dist(seq6(i,:),8,A06,1);
    if result6<min_value
        min_value=result6;
        min_index=i;
        min_point=point6;
    end
end

for i=1:9
    plot([min_point(i,1) min_point(i+1,1)],[min_point(i,2) min_point(i+1,2)],'go-')
end