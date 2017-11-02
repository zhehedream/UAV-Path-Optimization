clear
clc
addpath('./sub/')
data;
disp('1-Question 1, the path of S1')
disp('2-Question 1, the path of S2')
disp('3-Question 3, the path of missile_plane & bmob_plane')
key=input('Please select the num: ');
switch key
    case 1
        disp('Please wait until the calculation is finished...');
        disp('It might be a long time');
        close all
        Draw_Map;
        camara=2;
        sig=1;
        [result1,seq1,point1,l1]=Get_Total_Rader_Dist1(camara,A01,A02,A08,A09,A03,sig);
        [result2,seq2,point2,l2]=Get_Total_Rader_Dist2(camara,A06,A05,A07,A10,A04,sig);
        disp('result1,seq1,point1,l1,result2,seq2,point2,l2 has recorded all the results of this question');
        result=sum(result1)+sum(result2);
        Show_Result(['The minimum rader traveling distance is ' num2str(result)]);
    case 2
        disp('Please wait until the calculation is finished...');
        disp('It might be a long time');
        close all
        Draw_Map;
        Question_2;
        disp('result,point,l has recorded all the results of this question');
        Show_Result(['The minimum rader traveling distance is ' num2str(result)]);
    case 3
        disp('Please wait until the calculation is finished...');
        disp('It might be a long time');
        close all
        Draw_Map;
        Question_3;
        disp('min_point,min_value has recorded all the results of this question');
        Show_Result(['The minimum rader traveling distance is ' num2str(min_value)]);
end


rmpath('./sub/')