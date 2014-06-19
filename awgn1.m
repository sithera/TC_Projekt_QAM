function [ Szum ] = awgn1( snr, S ,fs,wart)

fb = log2(wart)*1000;
ebn0= 10^(snr/10); %stostunek Eb/N0 w dB
eb = sum(S.^2)/(length(S)*fb);  %energy per bit  fb=bit rate in bits-per-second.
n0 = eb/ebn0;  %power spectral density of noise
pn= n0*fs/2;  %noise variance  fs=sampling frequency
Szum = sqrt(pn)*randn(1,length(S));  

end

