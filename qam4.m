function [I,Q] = qam4(data)

N=numel(data);
P=N/2; %ilosc punktow
I=zeros(1,P);
Q=zeros(1,P);

for PA=(1:1:P) %PA ILOSC 4 I MIEJSCE W TABELI
    
    PB=PA*2;
    if (data(PB-1) == 0) % liczymy I
       I(PA)=1;
    else
       I(PA)=-1;
    end
    
    
    if (data(PB) == 0) % liczymy I
       Q(PA)=1;
    else
       Q(PA)=-1;
    end
    
    %I1(PA)=(I(PA)/4)+PA
    %Q1(PA)=Q(PA)
end %dla for

%bar(I, 0.4)

end