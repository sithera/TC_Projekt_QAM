clear all
close all

%data= [0 0 0 0  ]
%data = [  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]
%data=[     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
data=[ 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0]
%data=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]
%data=[ 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]
%data=[0 0 0 0 0 1 0 1 1 0 1 0 1 1 1 1]

[I,Q]=qam1(data)    %nasza funkcja
P=(numel(data))/4

 %SYGNAL
    fc=1000;             
    fs=100000;         
f0=fc/fs; 
t=0:99
 S=[]


    for i=1:1:P        % Modulacja
%for  t=0:1:99
        s1=I(i)*cos(2*pi*f0*t);    %  fc/fs  ??
        s2=Q(i)*sin(2*pi*f0*t);
%end
S=[S (s1-s2)];    %Sygna³ czysty - zape³nianie tablicy
    end


T=(numel(t))
TP=T*P  
t1 = 1:1:length(S);
 
%AWGN                       t*P
snr=10;
 Szum = awgn1( snr, S ,fs,fc);
SS=Szum+S;                      % sygnal plus szum
plot(t1,SS,'blue',t1,S,'red');


%FILTR
for i=1:1:P    %dolno
Scos((i-1)*100+t+1)=SS((i-1)*100+t+1).*cos(2*pi*f0*t);
Ssin((i-1)*100+t+1)=SS((i-1)*100+t+1).*sin(2*pi*f0*t);
end

[b,a]=butter(4,0.1);    %b-filtr
BI=2.*filter(b,a,Scos);
BQ=2.*filter(b,a,Ssin);     
%subplot(3,1,2); plot(Scos) title('syg*cos')
%subplot(3,1,3); plot(BI) title('po filtrze')

%FILTR2
%N=T-1;
%A=[ 1 1 0 0]
%F=[0, 500, 2000, (fs/2)]/(fs/2);   %fpass, fstop
%W=[1 ,1] ; %[wpass, wstop]
%h = remez(N,F,A,W);  

IdSr=[ ];                      %DEModulacja
QdSr=[ ];
for i=1:1:P    %dolno
    IdSr(i)= mean(BI(i+(((i-1)*100)):(i*100)));
    QdSr(i)= mean(BQ(i+(((i-1)*100)):(i*100)));
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


Sodt=[];
for i=1:1:P        % odtworzony sygnal
        sd1=Id(i)*cos(2*pi*f0*t);    %  fc/fs  ??
        sd2=Qd(i)*sin(2*pi*f0*t);
Sodt=[Sodt (sd1-sd2)];    %czysty
    end

figure(1)
axis([0 TP -5 5 ])
subplot(3,1,1);
    plot(S)   
    title('16-QAM Modulated Signal')
    axis([0 TP -5 5 ])   %skalaa
subplot(3,1,2);
    plot(SS)   %
    title('16-QAM Modulated Signal+Noise')
    axis([0 TP -5 5 ])   %skalaa
subplot(3,1,3);
    plot(Sodt)   %
    title('Sygnal odtworzony')
    axis([0 TP -5 5 ])   %skalaa

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

ber = sum(abs(data-dataWyj))/length(data)