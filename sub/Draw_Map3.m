%Draw Map
clc
data;
figure(1);
hold on;

config=struct('is_show_title',0, ...
              'is_show_radar_area',1, ...
              'is_verbose',0);

Draw_Group(1,A01,1,config);
Draw_Group(1,A02,2,config);
Draw_Group(1,A03,3,config);
Draw_Group(1,A04,4,config);
Draw_Group(1,A05,5,config);
Draw_Group(1,A06,6,config);
Draw_Group(1,A07,7,config);
Draw_Group(1,A08,8,config);
Draw_Group(1,A09,9,config);
Draw_Group(1,A10,10,config);

Draw_Station(1,Station);
