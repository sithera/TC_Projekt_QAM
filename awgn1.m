function [ Szum ] = awgn1( snr, S ,fs,fc)

fc=10000;  % fb= fc ?
ebn0= 10^(snr/10); %stostunek Eb/N0 w dB
eb = sum(S.^2)/(length(S)*fc);  %energy per bit  fb=bit rate in bits-per-second.
n0 = eb/ebn0;  %power spectral density of noise
pn= n0*fs/2;  %noise variance  fs=sampling frequency
Szum = sqrt(pn)*randn(1,length(S));  %szum

%t1 = 1:1:length(S);
 %plot(t1,Szum+S,'blue',t1,S,'red')

end

