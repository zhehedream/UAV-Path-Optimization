% Show_Result
% Input: str
%        Message on MessageBox

function Show_Result(str)
h=msgbox(str);  
th = findall(0, 'Tag','MessageBox' );  
boxPosition = get(h,'position');  
textPosition = get(th, 'position');   
set(th, 'position', [boxPosition(3).*0.5 textPosition(2) textPosition(3)]);  
set(th, 'HorizontalAlignment', 'center');  