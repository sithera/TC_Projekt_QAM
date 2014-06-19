function [err_sum, dataWyj] = qamm(snr,data,wart)
%data= [0 0 0 0 0 0 0 0 ]
%data = [  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]
%data=[     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
%data=[ 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  1 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 1 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0]
%data=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]
%data=[ 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 ]
%data=[0 0 0 0 0 1 0 1 1 0 1 0 1 1 1 1]
%data = bit_generate();


%Wybierz sposób modulacji
%wart= 4;  % lub 4 lub 16
if wart == 4
    W=2;         % W czyli iloœæ bitow w paczce
    [I,Q]=qam4(data);
elseif wart == 16
    W=4;
    [I,Q]=qam16(data);
else
    W=6;
    [I,Q]=qam64(data);
end;

setappdata(0,'I',I);
setappdata(0,'Q',Q);

%nasza funkcja
P=(numel(data))/W;

%SYGNAL
fc=1000;
fs=100000;
f0=fc/fs;
t=0:99;
S=[];
s11=[];
s12=[];

for i=1:1:P        % Modulacja
    s1=I(i)*cos(2*pi*f0*t);    %  fc/fs  ??
    s2=Q(i)*sin(2*pi*f0*t);
    %S=[S (s1-s2)];    %czysty
    s11=[s11 s1 ];
    s12=[s12 s2 ];
end

setappdata(0,'s11',s11);
setappdata(0,'s12',s12);
S=s11-s12;

T=(numel(t));
TP=T*P;


setappdata(0,'max_freq',TP);

%AWGN                       t*P
%snr=10;
%SS = awgn(S,snr,'measured');
Szum = awgn1( snr, S ,fs,wart);
SS=Szum+S;  % sygnal plus szum
setappdata(0,'SS',SS);
%%plot(t1,SS,'blue',t1,S,'red');



for i=1:1:P    %dolno
    Scos((i-1)*100+t+1)=SS((i-1)*100+t+1).*cos(2*pi*f0*t);
    Ssin((i-1)*100+t+1)=SS((i-1)*100+t+1).*sin(2*pi*f0*t);
end

[b,a]=butter(1,0.9999);
BI=2*filter(b,a,Scos);
BQ=2*filter(b,a,Ssin);


IdSr=[ ];                      %DEModulacja
QdSr=[ ];
for i=1:1:P    %dolno
    IdSr(i)= mean(BI((1+(i-1)*100):(i*100)));
    QdSr(i)= mean(BQ((1+(i-1)*100):(i*100)));
end
Id=[];
Qd=[];

setappdata(0,'Scos',Scos);
setappdata(0,'Ssin',Ssin);
setappdata(0,'BI',BI);
setappdata(0,'BQ',BQ);
setappdata(0,'IdSr',IdSr);
setappdata(0,'QdSr',QdSr);

%demodulacja
if wart == 4
    [ Id, Qd ] = demqam4( QdSr, IdSr , P);
    [dataWyj]=dem2qam4(Id,Qd,P);
elseif wart ==16
    [ Id, Qd ] = demqam16( QdSr, IdSr , P);
    [dataWyj]=dem2qam16(Id,Qd,P);
else
    [ Id, Qd ] = demqam64( QdSr, IdSr , P);
    [dataWyj]=dem2qam64(Id,Qd,P);
end;



err_sum = sum(abs(data - dataWyj));
setappdata(0,'S',S);
setappdata(0,'Id',Id);
setappdata(0,'Qd',Qd);
setappdata(0,'dataWyj',dataWyj);

