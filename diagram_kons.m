function [  ] = diagram_kons( wart )

wykres = getappdata(0,'wykres');

IdSr = getappdata(0,'IdSr');
QdSr = getappdata(0,'QdSr');
axes(wykres);

scatter(IdSr,QdSr,100,'b.');
if wart == 4
    
    idealr4 = [-1,-1,-1,-1,1,1,1,1];
    ideali4 = [+3,1,-1,-3,3,1,-1,-3];
    
    hold on
    scatter(idealr4,ideali4,300,'r.');
    axis([-2 2 -2 2]);
    grid on
    set(gca,'XTick',[-2:2:2],'YTick',[-2:2:2]);
    
    
elseif wart == 16
    
    idealr16 = [-3,-3,-3,-3,-1,-1,-1,-1,1,1,1,1,3,3,3,3];
    ideali16 = [3,1,-1,-3,+3,1,-1,-3,3,1,-1,-3,3,1,-1,-3];
    
    hold on
    scatter(idealr16,ideali16,300,'r.');
    axis([-4 4 -4 4]);
    grid on
    set(gca,'XTick',[-4:2:4],'YTick',[-4:2:4]);
    
    
else
    
    idealr64 = [-7,-7,-7,-7,-7,-7,-7,-7,-5,-5,-5,-5,-5,-5,-5,-5,-3,-3,-3,-3,-3,-3,-3,-3,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,5,5,5,5,5,5,5,5,7,7,7,7,7,7,7,7];
    ideali64 = [7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7,7,5,3,1,-1,-3,-5,-7];
    
    hold on
    scatter(idealr64,ideali64,300,'r.');
    axis([-8 8 -8 8]);
    grid on
    set(gca,'XTick',[-8:2:8],'YTick',[-8:2:8]);
    
end

xlabel('In-Phase');
ylabel('Quadrature');
title(['Constelation Diagram for QAM ' num2str(wart) ]);
hold off
end

