for snr=1:1:15
ber(snr) = qamm(snr)
end
k=4;
Eb_N0_dB  = [0:15];
theoryBer = (1/k)*3/2*erfc(sqrt(k*0.1*(10.^(Eb_N0_dB/10))));
figure(10)
semilogy(Eb_N0_dB,theoryBer,'bs-','LineWidth',2);
hold on
semilogy(Eb_N0_dB,ber,'mx-','LineWidth',2);
axis([0 15 10^-6 1])
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB')
ylabel('Bit Error Rate')
title('Bit error probability curve for 16-QAM modulation')