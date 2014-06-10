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
t1 = 1:1:length(S);

setappdata(0,'max_freq',TP);

%AWGN                       t*P
%snr=10;
%SS = awgn(S,snr,'measured');
Szum = awgn1( snr, S ,fs,fc);
SS=Szum+S;  % sygnal plus szum
setappdata(0,'SS',SS);
%%plot(t1,SS,'blue',t1,S,'red');



for i=1:1:P    %dolno
    Scos((i-1)*100+t+1)=SS((i-1)*100+t+1).*cos(2*pi*f0*t);
    Ssin((i-1)*100+t+1)=SS((i-1)*100+t+1).*sin(2*pi*f0*t);
end
% BI = Scos;
% BQ = Ssin;
[b,a]=butter(4,0.15);%(4,0.15);
BI=2*filtfilt(b,a,Scos);%2.*filter(b,a,Scos);
BQ=2*filtfilt(b,a,Ssin);%2.*filter(b,a,Ssin);
%subplot(3,1,2); plot(Scos) title('syg*cos')
%subplot(3,1,3); plot(BI) title('po filtrze')

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


Sodt=[];
for i=1:1:P        % odtworzony sygnal
    sd1=Id(i)*cos(2*pi*f0*t);    %  fc/fs  ??
    sd2=Qd(i)*sin(2*pi*f0*t);
    Sodt=[Sodt (sd1-sd2)];    %czysty
end

err_sum = sum(abs(data - dataWyj));
setappdata(0,'S',S);
setappdata(0,'Sodt',Sodt);
setappdata(0,'Id',Id);
setappdata(0,'Qd',Qd);
setappdata(0,'dataWyj',dataWyj);

% figure(1)    %pocz¹tek
% subplot(7,1,1);
% stairs(data,'red')
% axis([0 T -1 2 ])
% title('wiadomosc')
% 
% subplot(7,1,2);
% stairs(I,'red')
% axis([0 P -8 8 ])
% title('decyzyjny QAM I')
% 
% subplot(7,1,3);
% stairs(Q,'red')
% axis([0 P -8 8 ])
% title('decyzyjny QAM Q')
% 
% subplot(7,1,4);
% plot(s11)
% title('I*cos')
% 
% subplot(7,1,5);
% plot(s12)
% title('Q*sin')
% 
% subplot(7,1,6);
% plot(S)
% title('Sygnal wysylany do kanalu')
% 
% subplot(7,1,7);
% plot(SS)
% title('Sygnal odebrany(z szumem)')
% 
% figure(2)
% subplot(4,1,1);
% plot(Ssin)
% title('syg*sin    Q')
% 
% subplot(4,1,2);
% plot(BQ)
% title('sin po filtrze')
% 
% subplot(4,1,3);
% plot(Scos)
% title('syg*cos    I')
% subplot(4,1,4);
% plot(BI)
% title('cos po filtrze')
% %end
% 
% 
% 
% 
% figure(3)  %koniec
% subplot(4,1,1);
% plot(Sodt)
% title('sygna³ odtworzony')
% axis([0 TP -10 10 ])   %skalaa
% 
% subplot(4,1,2);
% stairs(Id,'red')
% axis([0 P -8 8 ])
% title('decyzyjny QAM I')
% 
% subplot(4,1,3);
% stairs(Qd,'red')
% axis([0 P -8 8 ])
% title('decyzyjny QAM Q')
% 
% subplot(4,1,4);
% stairs(data,'red')
% axis([0 T -1 2 ])  %
% title('wiadomosc odtworzona')

