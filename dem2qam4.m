function [dataWyj] = dem2qam4(Id,Qd, P)
dataWyj=[]
for i=1:1:P
    
        if Id(i)==1 && Qd(i)==1
        dataWyj=[dataWyj  0 0];
    elseif Id(i)==1 && Qd(i)==-1
        dataWyj=[dataWyj  0 1];

    elseif Id(i)==-1 && Qd(i)==1
        dataWyj=[dataWyj  1 0];
    elseif Id(i)==-1 && Qd(i)==-1
        dataWyj=[dataWyj  1 1];
  
    end

end

end