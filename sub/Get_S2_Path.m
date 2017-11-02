% Get_S2_Path
% Get the path of S2 in Group A which has the lowest travel distance
%
% Input: A
%        Point set of bases
% Output: dpf
%        Travel path

function dpf=Get_S2_Path(A,opt)
n=size(A,1);
pf=Get_Point_Cluster(A,7.5);
ori_n=length(pf);
un=[];
for i=1:size(pf,1)
    un=union(un,pf{i,1});
end
V=1:1:n;
d=setdiff(V,un);
if isempty(d)
    [x,y]=Get_Point_Center(A,V);
    dpf=[x,y];
else
    tmp_dpf=cell(10000,1);
    num=0;
    for i=1:length(d)
        pf=[pf;d(i)];
    end
    vec=1:1:size(pf,1);
    for i=2:n
        tmp=nchoosek(vec,i);
        for j=1:size(tmp,1)
            tmp2=tmp(j,:);
            tmp_un=tun(pf,tmp2);
            if length(tmp_un)==n
                num=num+1;
                tmp_dpf{num,1}=tmp2;
            end
        end
    end
    %开始计算pf等效中心
    pf_point=zeros(size(pf,1),2);
    for i=1:size(pf,1)
        [pf_point(i,1),pf_point(i,2)]=Get_Point_Center(A,pf{i,:});
    end
    %pf
    %pf_point
    min_lxd=1e12;
    min_index=0;
    min_point=[];
    for i=1:num
        %disp([num2str(i) '  ' num2str(num)]);
        tmp_point=[];
        tmp_set=tmp_dpf{i,1};
        %tmp_set
        for j=1:length(tmp_dpf{i,1})
            tmp_index=tmp_set(1,j);
            if tmp_index>ori_n
                continue;
            end
            tmp_point=[tmp_point;pf_point(tmp_index,1) pf_point(tmp_index,2)];
        end
        ave_x=sum(tmp_point(:,1))/size(tmp_point,1);
        ave_y=sum(tmp_point(:,2))/size(tmp_point,1);
        for j=1:length(tmp_dpf{i,1})
            tmp_index=tmp_set(1,j);
            if tmp_index<=ori_n
                continue;
            end
            [nx,ny]=Adj_xy(ave_x,ave_y,pf_point(tmp_index,1),pf_point(tmp_index,2));
            tmp_point=[tmp_point;nx ny];
        end
        %tmp_point
        %lxd=Get_lxd(tmp_point);
        %lxd
        if size(tmp_point,1)>5 && opt==1
            continue;
        end
        if size(tmp_point,1)>6 && opt==2
            continue;
        end
        [tmp_point,dist]=Get_Points_Order(tmp_point);
        if dist<min_lxd
            min_lxd=dist;
            min_index=i;
            min_point=tmp_point;
        end
    end
    dpf=min_point;
end

% nn=size(dpf,1);
% if nn==1
%     Circle(1,7.5,dpf(1,1),dpf(1,2));
% end
% for i=1:nn-1
%     plot([dpf(i,1) dpf(i+1,1)],[dpf(i,2) dpf(i+1,2)],'bo-')
%     Circle(1,7.5,dpf(i,1),dpf(i,2));
%     Circle(1,7.5,dpf(i+1,1),dpf(i+1,2));
% end

function un=tun(pf,v)
un=[];
for i=1:length(v)
    un=union(un,pf{v(i),:});
end
un=reshape(un,1,size(un,1)*size(un,2));


function [xo,yo]=Adj_xy(x0,y0,x,y)
st=atan((y-y0)/(x-x0));
if y0<y && x0<x
    dy=sin(st)*7.5;
    dx=cos(st)*7.5;
    xo=x-dx;
    yo=y-dy;
elseif y0<y && x0>x
    st=-st;
    dy=sin(st)*7.5;
    dx=cos(st)*7.5;
    xo=x+dx;
    yo=y-dy;
elseif y0>y && x0<x
    st=-st;
    dy=sin(st)*7.5;
    dx=cos(st)*7.5;
    xo=x-dx;
    yo=y+dy;
else
    dy=sin(st)*7.5;
    dx=cos(st)*7.5;
    xo=x+dx;
    yo=y+dy;
end


