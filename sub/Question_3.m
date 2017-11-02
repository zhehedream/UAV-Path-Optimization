rp=[264,715;225,605;168,538;210,455;120,400;96,304;10,451;162,660;110,561;105,473;];
rp=[rp(6,:);rp(5,:);rp(7,:);rp(10,:);rp(4,:);rp(3,:);rp(9,:);rp(8,:);rp(2,:);rp(1,:);];

%Draw_Map;

%[result,p]=Calc_Rad_Destroy([rp(6,:);rp(5,:);rp(7,:)],16);

c={ones(1,10)};
d=perms([2 1 1 1 1 1 1 1 1]);
d=unique(d,'rows');
for i=1:size(d,1)
    c=[c;d(i,:)];
end
d=perms([2 2 1 1 1 1 1 1]);
d=unique(d,'rows');
for i=1:size(d,1)
    c=[c;d(i,:)];
end
d=perms([2 2 2 1 1 1 1]);
d=unique(d,'rows');
for i=1:size(d,1)
    c=[c;d(i,:)];
end
d=perms([2 2 2 2 1 1]);
d=unique(d,'rows');
for i=1:size(d,1)
    c=[c;d(i,:)];
end
d=perms([2 2 2 2 2]);
d=unique(d,'rows');
for i=1:size(d,1)
    c=[c;d(i,:)];
end

opt=32;

min_value=1e12;
min_index=0;
min_point={};
for i=1:size(c,1)
    un=c{i,1};
    tmp_point={};
    S=0;
    value=0;
    rp_temp=rp;
    for j=1:size(un,2)
        if un(1,j)==1
            value=value+0.45;
            tmp_point=[tmp_point;rp_temp(S+1,:)];
            rp_temp(S+1,:)=[-1000,-1000];
            S=S+1;
        else
            group=rp(S+1:S+2,:);
            [result,p]=Calc_Rad_Destroy(group,opt,rp_temp);
            value=value+result+40/300+55/200*2+30/720*2;
            tmp_point=[tmp_point;p];
            rp_temp(S+1:S+2,:)=[-1000,-1000;-1000,-1000;];
            S=S+2;
        end
    end
    if value<min_value
        min_value=value;
        min_index=i;
        min_point=tmp_point;
    end
end

st=[156,340
69,413
116,491
230,675];
st_n=1;

%subplot(2,2,1)
Draw_Map;
%title('A05 A06 区域，导弹无人机路线')
for i=1:size(min_point,1)
    temp=min_point{i,1};
    if size(temp,1)==1
        plot(temp(1,1),temp(1,2),'xr-','LineWidth',3);
    else
        plot([st(st_n,1) temp(1,1)],[st(st_n,2) temp(1,2)],'xb-','LineWidth',3);
        st_n=st_n+1;
        plot([temp(1,1) temp(2,1)],[temp(1,2) temp(2,2)],'xr-','LineWidth',3);
    end
end
grid on
% subplot(2,2,2)
% Draw_Map3;
% title('A07 A10 区域，导弹无人机路线')
% st_n=1;
% for i=1:size(min_point,1)
%     temp=min_point{i,1};
%     if size(temp,1)==1
%         plot(temp(1,1),temp(1,2),'xr-','LineWidth',3);
%     else
%         plot([st(st_n,1) temp(1,1)],[st(st_n,2) temp(1,2)],'xb-','LineWidth',3);
%         st_n=st_n+1;
%         plot([temp(1,1) temp(2,1)],[temp(1,2) temp(2,2)],'xr-','LineWidth',3);
%     end
% end
% grid on
% subplot(2,2,3)
% Draw_Map3;
% title('A03 A09 区域，导弹无人机路线')
% st_n=1;
% for i=1:size(min_point,1)
%     temp=min_point{i,1};
%     if size(temp,1)==1
%         plot(temp(1,1),temp(1,2),'xr-','LineWidth',3);
%     else
%         plot([st(st_n,1) temp(1,1)],[st(st_n,2) temp(1,2)],'xb-','LineWidth',3);
%         st_n=st_n+1;
%         plot([temp(1,1) temp(2,1)],[temp(1,2) temp(2,2)],'xr-','LineWidth',3);
%     end
% end
% grid on
% subplot(2,2,4)
% Draw_Map3;
% title('A02 A08 区域，导弹无人机路线')
% st_n=1;
% for i=1:size(min_point,1)
%     temp=min_point{i,1};
%     if size(temp,1)==1
%         plot(temp(1,1),temp(1,2),'xr-','LineWidth',3);
%     else
%         plot([st(st_n,1) temp(1,1)],[st(st_n,2) temp(1,2)],'xb-','LineWidth',3);
%         st_n=st_n+1;
%         plot([temp(1,1) temp(2,1)],[temp(1,2) temp(2,2)],'xr-','LineWidth',3);
%     end
% end
% grid on