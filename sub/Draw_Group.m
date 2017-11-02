% Draw_Group
% Input: fig_num
%        The figure id of the window you want to overly
% Input: mat
%        The data matrix of target group
% Input: id
%        Group id
% Input: config
%         config.is_show_title=1
%         config.is_show_radar_area=1
%         config.is_verbose=1

function Draw_Group(fig_num,mat,id,config)
%,is_show_title,is_show_radar_area,is_verbose)
if 3==nargin
    config=struct('is_show_title',1, ...
                  'is_show_radar_area',1, ...
                  'is_verbose',0);
end

figure(fig_num);
plot(mat(1,1),mat(1,2),'or');
plot(mat(1,1),mat(1,2),'*b');

if 1==config.is_show_radar_area
    Circle(fig_num,70,mat(1,1),mat(1,2));
end

for i=2:length(mat)
    plot(mat(i,1),mat(i,2),'*b');
    %Circle(fig_num,2,mat(i,1),mat(i,2));
end

if 1==config.is_show_title
    if id==10
        text(mat(1,1)-10,mat(1,2)-10,['A' num2str(id)]);
    else
        text(mat(1,1)-10,mat(1,2)-10,['A0' num2str(id)]);
    end
end

n=length(mat);
aver_x=sum(mat(:,1))/n;
aver_y=sum(mat(:,2))/n;

if 1==config.is_verbose
    disp(['区域' num2str(id) '的平均坐标为(' num2str(aver_x) ',' num2str(aver_y) ')']);
end
