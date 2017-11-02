function [result,point]=Get_Travel_Dist(seq,camara,A,sig)
n=size(seq,2);
%in_dis=70-sqrt((center_x-A(seq(1),1))^2+(center_y-A(seq(1),2))^2);
%out_dis=70-sqrt((center_x-A(seq(n),1))^2+(center_y-A(seq(n),2))^2);
result=0;
point=[];
for i=1:n-1
    x1=A(seq(1,i),1);
    y1=A(seq(1,i),2);
    x2=A(seq(1,i+1),1);
    y2=A(seq(1,i+1),2);
    st=atan((y2-y1)/(x2-x1));
    if y2<y1 && x2<x1
        dx=sin(st)*camara*sig;
        dy=cos(st)*camara*sig;
        point=[point;x1+dx,y1-dy;x2+dx,y2-dy];
    elseif y2>y1 && x2<x1
        st=-st;
        dx=sin(st)*camara*sig;
        dy=cos(st)*camara*sig;
        point=[point;x1-dx,y1-dy;x2-dx,y2-dy];
    elseif y2<y1 && x2>x1
        st=-st;
        dx=sin(st)*camara*sig;
        dy=cos(st)*camara*sig;
        point=[point;x1+dx,y1+dy;x2+dx,y2+dy];
    else
        dx=sin(st)*camara*sig;
        dy=cos(st)*camara*sig;
        point=[point;x1-dx,y1+dy;x2-dx,y2+dy];
    end
end
for i=1:length(point)-1
    result=result+sqrt((point(i+1,1)-point(i,1))^2+(point(i+1,2)-point(i,2))^2);
end
result=result;%+in_dis+out_dis;