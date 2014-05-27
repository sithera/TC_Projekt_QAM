%clear all
%close all
function [err_sum, dataWyj] = qamm(snr,data)
%data= [0 0 0 0 0 0 0 0 ]
%data = [  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]
%data=[     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
%data=[ 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0]
%data=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]
%data=[ 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]
%data=[0 0 0 0 0 1 0 1 1 0 1 0 1 1 1 1]
%data = bit_generate();

[I,Q]=qam1(data);    %nasza funkcja
P=(numel(data))/4;

%SYGNAL
fc=1000;
fs=100000;
f0=fc/fs;
t=1:100;
S=[];

for i=1:1:P        % Modulacja
    s1=I(i)*cos(2*pi*f0*t);    %  fc/fs  ??
    s2=Q(i)*sin(2*pi*f0*t);
    S=[S (s1-s2)];    %czysty
end

T=(numel(t));
TP=T*P;
t1 = 1:1:length(S);

setappdata(0,'max_freq',TP);

%AWGN                       t*P
%snr=5;
%SS = awgn(S,snr,'measured');
Szum = awgn1( snr, S ,fs,fc);
SS=Szum+S;  % sygnal plus szum
setappdata(0,'SS',SS);
%%plot(t1,SS,'blue',t1,S,'red');



for i=1:1:P    %dolno
    for t=1:1:100
        Scos((i-1)*100+t)=SS((i-1)*100+t).*cos(2*pi*f0*t);
        Ssin((i-1)*100+t)=SS((i-1)*100+t).*sin(2*pi*f0*t);
    end
end
%BI = Scos;
%BQ = Ssin;
[b,a]=butter(3,0.1);
BI=2.*filter(b,a,Scos);
BQ=2.*filter(b,a,Ssin);
%subplot(3,1,2); plot(Scos) title('syg*cos')
%subplot(3,1,3); plot(BI) title('po filtrze')

IdSr=[ ];                      %DEModulacja
QdSr=[ ];
for i=1:1:P    %dolno
    IdSr(i)= mean(BI(i+(((i-1)*100)):(i*100)));
    QdSr(i)= mean(BI(i+(((i-1)*100)):(i*100)));
end
Id=[];
Qd=[];
for i=1:1:P
    if IdSr(i)>=2
        Id(i)=3;
    elseif IdSr(i)<2 && IdSr(i)>=0
        Id(i)=1;
    elseif IdSr(i)>= -2 && IdSr(i)<0
        Id(i)=-1;
    else IdSr(i)< -2
        Id(i)=-3;
    end
    
    if QdSr(i)>=2
        Qd(i)=3;
    elseif QdSr(i)<2 && QdSr(i)>=0
        Qd(i)=1;
    elseif QdSr(i)>= -2 && QdSr(i)<0
        Qd(i)=-1;
    else QdSr(i)< -2
        Qd(i)=-3;
    end
    
end;

[dataWyj]=demqam1(Id,Qd,P);

t2=1:100;
Sodt=[];
for i=1:1:P        % odtworzony sygnal
    sd1=Id(i)*cos(2*pi*f0*t2);    %  fc/fs  ??
    sd2=Qd(i)*sin(2*pi*f0*t2);
    Sodt=[Sodt (sd1-sd2)];    %czysty
end

err_sum = sum(abs(data - dataWyj));
setappdata(0,'S',S);
setappdata(0,'Sodt',Sodt);

%figure(1)
%axis([0 TP -5 5 ])
%subplot(3,1,1);
%plot(S)
%title('16-QAM Modulated Signal')
%axis([0 TP -5 5 ])   %skalaa
%subplot(3,1,2);
%plot(SS)   %
%title('16-QAM Modulated Signal+Noise')
%axis([0 TP -5 5 ])   %skalaa
%subplot(3,1,3);
%plot(Sodt)   %
%title('Sygnal odtworzony')
%axis([0 TP -5 5 ])   %skalaa

figure(2)
subplot(4,1,1);
plot(Ssin)
title('syg*sin')
subplot(4,1,2);
plot(BQ)
title('sin po filtrze')

subplot(4,1,3);
plot(Scos)
title('syg*cos')
subplot(4,1,4);
plot(BI)
title('cos po filtrze')
end
