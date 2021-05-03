function [] = gui()
global a;
a.val = 0; %%this sets a default value for 'a'
a.fig = figure('numbertitle','off','name','Graph a Function'); %%this calls a GUI

%%the following 3 lines create 3 textboxes, one that says 'f(x) = x^a', the
%%value of a, and 'a = ', respectively
a.func = uicontrol('style','text','units','normalized','position', [.0 .78 .08 .095],'string','f(x) = x^a','horizontalalignment','right');
a.num = uicontrol('style','text','units','normalized','position', [.03 .76 .04 .05],'string',num2str(a.val),'horizontalalignment','right');
a.yIs = uicontrol('style','text','units','normalized','position', [.0 .76 .05 .05],'string','a = ','horizontalalignment','right');

%%the following 3 lines create 3 buttons, one to add 1 to a, one to
%%subtract one from a, and one to refresh the plot, respectively
a.addY = uicontrol('style','pushbutton','units','normalized','position',[.034 .007 .14 .05],'string','Add 1 to a','callback', {@addA,1});
a.subY = uicontrol('style','pushbutton','units','normalized','position',[.3 .007 .14 .05],'string','Sub 1 from a','callback', {@subA,1});
a.refresh = uicontrol('style','pushbutton','units','normalized','position',[.6 .007 .14 .05],'string','Refresh Plot','callback', {@makePlot});

%%the following creates a plot to begin with, using the default value for 'a', a.val = 0, plotting f(x) = x^0
makePlot();

end

function [] = addA(source, event, add) 
%%this function adds 1 to the value of a and updates the textbox that says
%%the value of a
global a;
a.val = a.val + add;
a.num.String = num2str(a.val);


end

function [] = subA(source, event, sub)
%%this function subtracts 1 from the value of a and updates the textbox that says
%%the value of a
global a;
a.val = a.val - sub;
a.num.String = num2str(a.val);


end

function [] = makePlot(source, event)
%%this function is called both in the master function to begin with and
%%whenever a user presses the button 'Refresh Plot.' It updates the plot
%%whenever a new desired value of a has been selected. 
global a;
i = 0;
x = 0;
array = zeros(11,2);
for i = 1:11
    x = i - 6;
    array(i,1) = x;
    array(i,2) = x ^ a.val;
end
plot(array(:,1),array(:,2),'o')
title('f(x)');
xlabel('x axis');
ylabel('y axis');

end

