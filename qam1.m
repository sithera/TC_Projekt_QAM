function [I,Q] = qam1(data)

N=numel(data)
P=N/4         %ilosc punktow
I=zeros(1,P)
Q=zeros(1,P)

for PA=(1:1:P)   %PA ILOSC 4 I MIEJSCE W TABELI 

PB=PA*4
if (data(PB-3) == 0)      % liczymy I

   if (data(PB-2) == 0 )
I(PA)=-3
   else
I(PA)=-1
   end;

   else
if (data(PB-2) == 0)
I(PA)=3
   else
I(PA)=1
end
end


if (data(PB-1) == 0)      % liczymy Q

   if (data(PB) == 0 )
Q(PA)=3
   else
Q(PA)=1
   end;

   else
if (data(PB) == 0)
Q(PA)=-3
   else
Q(PA)=-1
end
end
%I1(PA)=(I(PA)/4)+PA
%Q1(PA)=Q(PA)
end %dla for

%bar(I, 0.4)

end

