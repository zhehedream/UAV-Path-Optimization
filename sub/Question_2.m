%Question_2
%Draw_Map
point=[];
dpf=Get_S2_Path(A06,0);
point=[point;dpf];
dpf=Get_S2_Path(A05,0);
point=[point;dpf];
dpf=Get_S2_Path(A07,0);
dpf(1,1)=dpf(1,1)+4;
point=[point;dpf];
dpf=Get_S2_Path(A10,0);
point=[point;dpf];
dpf=Get_S2_Path(A04,0);
tmp=[dpf(1,:);dpf(2,:);dpf(3,:);dpf(7,:);dpf(4,:);dpf(5,:);];
point=[point;tmp];
dpf=Get_S2_Path(A03,0);
point=[point;dpf];
dpf=Get_S2_Path(A09,0);
dpf(1,1)=dpf(1,1)+6;
point=[point;dpf];
dpf=Get_S2_Path(A08,0);
dpf(1,2)=dpf(1,2)-6;
point=[point;dpf];
dpf=Get_S2_Path(A02,2);
tmp=zeros(size(dpf));
for i=1:size(dpf,1)
    tmp(i,:)=dpf(end+1-i,:);
end
point=[point;tmp];
dpf=Get_S2_Path(A01,1);
point=[point;dpf];
%ag=[80 226;19 280;30 330];
ag=[120 236];
dg=[284 782
330 783];
sp=[368 319];
point_rd=point;
point=[sp;ag;point;dg;sp];
state=[zeros(size([sp;ag],1),1);ones(size(point,1),1);zeros(size([dg;sp],1),1)];
for i=1:size(point,1)-1
    plot([point(i,1) point(i+1,1)],[point(i,2) point(i+1,2)],'bo-')
    Circle(1,7.5,point(i,1),point(i,2));
    Circle(1,7.5,point(i+1,1),point(i+1,2));
end
grid on
l=Get_Total_Dist(point);
result=Get_Total_Dist(point_rd)+140;

