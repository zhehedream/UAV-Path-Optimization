function [result,seq,point,l]=Get_Total_Rader_Dist1(camara,A1,A2,A8,A9,A3,sig)

o_point1=1;
i_point2=7;
o_point2=9;
i_point9=5;
o_point9=1;
i_point3=3;
o_point3=5;

seq=[];
list=1:size(A1,1);
list(:,o_point1)=[];
seq1=perms(list);
seq1=[seq1 ones(size(seq1,1),1)*o_point1];
min_result1=1e12;
min_point1=[];
ss=[];
for i=1:size(seq1,1)
    id=70-sqrt((A1(1,1)-A1(seq1(i,1),1))^2+(A1(1,2)-A1(seq1(i,2),2))^2);
    [result1,point1]=Get_Travel_Dist(seq1,camara,A1,sig);
    result1=result1+id;
    if result1<min_result1
        min_result1=result1;
        min_point1=point1;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

list=1:size(A2,1);
list(:,o_point2)=[];
list(:,i_point2)=[];
seq1=perms(list);
seq1=[ones(size(seq1,1),1)*i_point2 seq1 ones(size(seq1,1),1)*o_point2];
min_result2=1e12;
min_point2=[];
for i=1:size(seq1,1)
    id=sqrt((A2(i_point2,1)-A1(o_point1,1))^2+(A2(i_point2,2)-A1(o_point1,2))^2);
    [result2,point2]=Get_Travel_Dist(seq1,camara,A2,sig);
    result2=result2+id;
    if result2<min_result2
        min_result2=result2;
        min_point2=point2;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

list=1:size(A8,1);
seq1=perms(list);
min_result3=1e12;
min_point3=[];
for i=1:size(seq1,1)
    id=sqrt((A8(seq1(i,1),1)-A2(o_point2,1))^2+(A8(seq1(i,1),2)-A2(o_point2,2))^2);
    [result3,point3]=Get_Travel_Dist(seq1,camara,A8,sig);
    result3=result3+id;
    if result3<min_result3
        min_result3=result3;
        min_point3=point3;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

o_point8=ss(1,end);

list=1:size(A9,1);
list(:,i_point9)=[];
list(:,o_point9)=[];
seq1=perms(list);
seq1=[ones(size(seq1,1),1)*i_point9 seq1 ones(size(seq1,1),1)*o_point9];
min_result4=1e12;
min_point4=[];
for i=1:size(seq1,1)
    id=sqrt((A9(i_point9,1)-A8(o_point8,1))^2+(A9(i_point9,2)-A8(o_point8,2))^2);
    [result4,point4]=Get_Travel_Dist(seq1,camara,A9,sig);
    result4=result4+id;
    if result4<min_result4
        min_result4=result4;
        min_point4=point4;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

list=1:size(A3,1);
list(:,o_point3)=[];
list(:,i_point3)=[];
seq1=perms(list);
seq1=[ones(size(seq1,1),1)*i_point3 seq1 ones(size(seq1,1),1)*o_point3];
min_result5=1e12;
min_point5=[];
for i=1:size(seq1,1)
    id=sqrt((A3(i_point3,1)-A9(o_point9,1))^2+(A3(i_point3,2)-A9(o_point9,2))^2);
    [result5,point5]=Get_Travel_Dist(seq1,camara,A3,sig);
    result5=result5+id;
    if result5<min_result5
        min_result5=result5;
        min_point5=point5;
        ss=seq1(i,:);
    end
end
min_result5=min_result5+70;

point0=[368 319;330 750;250 820;210 760];
point6=[260 510;368 319];

seq=[seq ss];
result=[min_result1 min_result2 min_result3 min_result4 min_result5];
point=[point0;min_point1;min_point2; min_point3; min_point4; min_point5;point6];

l=sum(result);
l=l+sqrt((point0(2,1)-point0(1,1))^2+(point0(2,2)-point0(1,2))^2);
l=l+sqrt((point0(3,1)-point0(2,1))^2+(point0(3,2)-point0(2,2))^2);
l=l+sqrt((point0(4,1)-point0(3,1))^2+(point0(4,2)-point0(3,2))^2);
%l=l+sqrt((point1(1,1)-point0(4,1))^2+(point1(1,2)-point0(4,2))^2);
l=l+sqrt((min_point5(end,1)-point6(1,1))^2+(min_point5(end,2)-point6(1,2))^2)-70;
l=l+sqrt((point6(2,1)-point6(1,1))^2+(point6(2,2)-point6(1,2))^2);


for i=1:length(point)-1
    plot([point(i,1) point(i+1,1)],[point(i,2) point(i+1,2)],'go-')
end

