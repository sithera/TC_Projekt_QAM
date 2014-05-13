clear all
close all

%data= [0 0 0 0 0 0 0 0 ]
%data = [  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]
%data=[     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
%data=[ 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0]
%data=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]
%data=[ 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]
data=[0 0 0 0 0 1 0 1 1 0 1 0 1 1 1 1]

[I,Q]=qam1(data)    %nasza funkcja
P=(numel(data))/4

 %SYGNAL
    fc=1000;             
    fs=100000;         
f0=fc/fs;   
    t=1:100;
    S=[]

    for i=1:1:P        % Modulacja
        s1=I(i)*cos(2*pi*f0*t);    %  fc/fs  ??
        s2=Q(i)*sin(2*pi*f0*t);
S=[S (s1-s2)];    %czysty
    end
  
%AWGN                       t*P
T=(numel(t))
TP=T*P
awgn=(randn(1,(TP)))   %*0.9
%S1=S+awgn         %zaszumiony

%S1=awgn(S,1,'measured');     %na razie z funkcji

figure(1)
axis([0 TP -5 5 ])
subplot(3,1,1);
    plot(S)
    title('16-QAM Modulated Signal')
    axis([0 TP -5 5 ])   %skalaa

for i=1:1:P    %dolno
for t=1:1:100
Scos((i-1)*100+t)=(I(i)*cos(2*pi*f0*t)-Q(i)*sin(2*pi*f0*t)).*cos(2*pi*f0*t);
Ssin((i-1)*100+t)=(I(i)*cos(2*pi*f0*t)-Q(i)*sin(2*pi*f0*t)).*sin(2*pi*f0*t);
end
end

[b,a]=butter(3,0.15);
BI=2.*filter(b,a,Scos);
BQ=2.*filter(b,a,Ssin);     
%subplot(3,1,2); plot(Scos) title('syg*cos')
%subplot(3,1,3); plot(BI) title('po filtrze')

subplot(3,1,2); 
plot(Ssin) 
title('syg*sin')
subplot(3,1,3); 
plot(BQ) 
title('po filtrze')

IdSr=[ ];                      %DEModulacja
QdSr=[ ];
for i=1:1:P    %dolno
    IdSr(i)= mean(BI(i+(((i-1)*100)):(i*100)));
    QdSr(i)= mean(BI(i+(((i-1)*100)):(i*100)));
end
Id=[]
Qd=[]
for i=1:1:P
if IdSr(i)>=2
Id(i)=3
elseif IdSr(i)<2 && IdSr(i)>=0
Id(i)=1
elseif IdSr(i)>= -2 && IdSr(i)<0
Id(i)=-1
else IdSr(i)< -2
Id(i)=-3
end

if QdSr(i)>=2
Qd(i)=-3
elseif QdSr(i)<2 && QdSr(i)>=0
Qd(i)=-1
elseif QdSr(i)>= -2 && QdSr(i)<0
Qd(i)=1
else QdSr(i)< -2
Qd(i)=3
end

end;

[dataWyj]=demqam1(Id,Qd,P)