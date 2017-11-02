% Draw_Station
% Input: fig_id
%        The figure id of the window you want to overly
% Input: Station
%        The data matrix of Station

function Draw_Station(fig_id,Station)
figure(fig_id);
for i=1:length(Station)
    if Station(i,3)==0
        plot(Station(i,1),Station(i,2),'rx');
    else
        plot(Station(i,1),Station(i,2),'ro');
    end
end