function [ I, Q ] = qam64( data )
N=numel(data);
P=N/6; %ilosc punktow
I=zeros(1,P);
Q=zeros(1,P);

for PA=(1:1:P) %PA ILOSC paczek I MIEJSCE W TABELI
    
    PB=PA*6;
    if (data(PB-5) == 0) % liczymy I
        
        if (data(PB-4) == 0 )
            if (data(PB-3) == 0 )
I(PA)=-7; %000
            else
I(PA)=-5; %001
            end

        else
            if (data(PB-3) == 0 )
I(PA)=-1; %010
            else
I(PA)=-3; %011                
            end
        end;
        
    else
        if (data(PB-4) == 0)
            if (data(PB-3) == 0 )
I(PA)=7; %100
            else
I(PA)=5; %101
            end
        else
            if (data(PB-3) == 0 )
I(PA)=1; %110
            else
I(PA)=3; %111
            end
        end
    end
    
    
   if (data(PB-2) == 0) % liczymy I
        
        if (data(PB-1) == 0 )
            if (data(PB) == 0 )
Q(PA)=-7; %000
            else
Q(PA)=-5; %001
            end

        else
            if (data(PB-1) == 0 )
Q(PA)=-1; %010
            else
Q(PA)=-3; %011                
            end
        end;
        
    else
        if (data(PB-1) == 0)
            if (data(PB) == 0 )
Q(PA)=7; %100
            else
Q(PA)=5; %101
            end
        else
            if (data(PB) == 0 )
Q(PA)=1; %110
            else
Q(PA)=3; %111
            end
        end
   end

end %dla for

%bar(I, 0.4)
end

