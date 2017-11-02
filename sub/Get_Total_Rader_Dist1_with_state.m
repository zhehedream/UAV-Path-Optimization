function [result,seq,point,l,state]=Get_Total_Rader_Dist1_with_state(camara,A6,A5,A7,A10,A4,sig)

i_point6=1;
i_point5=2;
o_point5=7;
o_point4=1;


seq=[];
list=1:size(A6,1);
list(:,i_point6)=[];
seq1=perms(list);
seq1=[ones(size(seq1,1),1)*i_point6 seq1];
min_result1=1e12;
min_point1=[];
ss=[];
for i=1:size(seq1,1)
    id=70;
    [result1,point1]=Get_Travel_Dist(seq1,camara,A6,sig);
    result1=result1+id;
    if result1<min_result1
        min_result1=result1;
        min_point1=point1;
        ss=seq1(i,:);
    end
end
seq=[seq ss];
o_point6=ss(1,end);

list=1:size(A5,1);
list(:,o_point5)=[];
list(:,i_point5)=[];
seq1=perms(list);
seq1=[ones(size(seq1,1),1)*i_point5 seq1 ones(size(seq1,1),1)*o_point5];
min_result2=1e12;
min_point2=[];
for i=1:size(seq1,1)
    id=sqrt((A5(i_point5,1)-A6(o_point6,1))^2+(A5(i_point5,2)-A6(o_point6,2))^2);
    [result2,point2]=Get_Travel_Dist(seq1,camara,A5,sig);
    result2=result2+id;
    if result2<min_result2
        min_result2=result2;
        min_point2=point2;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

list=1:size(A7,1);
seq1=perms(list);
min_result3=1e12;
min_point3=[];
for i=1:size(seq1,1)
    id=sqrt((A7(seq1(i,1),1)-A5(o_point5,1))^2+(A7(seq1(i,1),2)-A5(o_point5,2))^2);
    [result3,point3]=Get_Travel_Dist(seq1,camara,A7,sig);
    result3=result3+id;
    if result3<min_result3
        min_result3=result3;
        min_point3=point3;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

o_point7=ss(1,end);

list=1:size(A10,1);
seq1=perms(list);
min_result4=1e12;
min_point4=[];
for i=1:size(seq1,1)
    id=sqrt((A10(seq1(i,1),1)-A7(o_point7,1))^2+(A10(seq1(i,1),2)-A7(o_point7,2))^2);
    [result4,point4]=Get_Travel_Dist(seq1,camara,A10,sig);
    result4=result4+id;
    if result4<min_result4
        min_result4=result4;
        min_point4=point4;
        ss=seq1(i,:);
    end
end
seq=[seq ss];

o_point10=ss(1,end);

list=1:size(A4,1);
list(:,o_point4)=[];
seq1=perms(list);
seq1=[seq1 ones(size(seq1,1),1)*o_point4 ];
min_result5=1e12;
min_point5=[];
for i=1:size(seq1,1)
    id=sqrt((A4(seq1(i,1),1)-A10(o_point10,1))^2+(A4(seq1(i,1),2)-A10(o_point10,2))^2);
    [result5,point5]=Get_Travel_Dist(seq1,camara,A4,sig);
    result5=result5+id;
    if result5<min_result5
        min_result5=result5;
        min_point5=point5;
        ss=seq1(i,:);
    end
end
seq=[seq ss];
min_result5=min_result5+70;

point0=[256 121;];
point6=[256 121;];

seq=[seq ss];
result=[min_result1 min_result2 min_result3 min_result4 min_result5];
%point=[point0;min_point1;min_point2; min_point3; min_point4; min_point5;point6];
%state=[zeros(size(point0,1),1);ones(size([min_point1;min_point2; min_point3; min_point4; min_point5],1),1);zeros(size(point6,1),1)];
point=[point0;min_point1;min_point1(end,:);min_point2;min_point2(end,:); min_point3;min_point3(end,:); min_point4; min_point4(end,:);min_point5;min_point5(end,:);point6];
s0=zeros(size(point0,1),1);
s1=ones(size(min_point1,1),1);
s2=ones(size(min_point2,1),1);
s3=ones(size(min_point3,1),1);
s4=ones(size(min_point4,1),1);
s5=ones(size(min_point5,1),1);
s6=zeros(size(point6,1),1);
state=[s0;s1;0;s2;0;s3;0;s4;0;s5;0;s6];


l=sum(result);
l=l+sqrt((point0(1,1)-min_point1(1,1))^2+(point0(1,2)-min_point1(1,2))^2);
l=l+sqrt((point6(1,1)-min_point5(end,1))^2+(point6(1,2)-min_point5(end,2))^2);



% for i=1:length(point)-1
%     plot([point(i,1) point(i+1,1)],[point(i,2) point(i+1,2)],'bo-')
% end

