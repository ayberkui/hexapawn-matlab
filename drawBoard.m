function drawBoard(AxisHandle,green,red,boardSize)
r=0.5;
rightEnd = boardSize*2;
topEnd = boardSize*2;
h=gcf;
if h==0
    h=figure;
end
% set(h,'Resize','off')
hold off
plot(AxisHandle,[0 0],[0 6],'k','LineWidth',2);
hold on
hax=gca;
for x = 2:2:rightEnd
    plot(AxisHandle,[x x],[0 topEnd],'k','LineWidth',2);    
end
for y = 0:2:topEnd
    plot(AxisHandle,[0 rightEnd],[y y],'k','LineWidth',2);
end
% plot([0 6],[2 2],'k','LineWidth',2);
% plot([0 6],[4 4],'k','LineWidth',2);
% plot([0 0],[0 6],'k','LineWidth',2);
% plot([6 6],[0 6],'k','LineWidth',2);
% plot([0 6],[0 0],'k','LineWidth',2);
% plot([0 6],[6 6],'k','LineWidth',2);

for i=1:size(green)
    pos= [(2*green(i,1)-1.75)  (2*green(i,2)-1.75)   1.5   1.5];
    rectangle('Position',pos,'FaceColor',[0 .5 0],'Curvature',[1 1]);
end
for i=1:size(red)
    pos= [(2*red(i,1)-1.75)  (2*red(i,2)-1.75)   1.5   1.5];
    rectangle('Position',pos,'FaceColor',[.75 0 0],'Curvature',[1 1]);
end
LabelX=[{'A'},{'B'},{'C'},{'D'},{'E'},{'F'},{'G'},{'H'},{'I'},{'J'},{'K'},...
    {'L'},{'M'},{'N'},{'O'},{'P'},{'Q'},{'R'},{'S'},{'T'},{'U'},{'V'},{'W'}...
    ,{'X'},{'Y'},{'Z'}];
LabelY=cell(1,26);
for i = 1:26
    LabelY(i) = {[num2str(i)]};
end
set(hax, 'XTick', 1:2:2*boardSize-1, 'XTickLabel', LabelX(1:boardSize),...
    'YTick',1:2:2*boardSize-1,'YTickLabel',LabelY(1:boardSize));
title('Hexapawn','Interpreter','Latex','FontSize',20)
end