function [] = BER();

%-------------- Porównanie QAM4 vs QAM16 vs QAM64 --------------%

wykres = getappdata(0,'wykres');
axes(wykres);
EbNodB=1:25;
EbNo=10.^(EbNodB/10);

semilogy(EbNodB,(4/6)*(1-1/sqrt(64))*(1/2)*erfc(sqrt(3*6*EbNo/(64-1))/sqrt(2)),'rs-','LineWidth',2);
hold on
semilogy(EbNodB,(4/4)*(1-1/sqrt(16))*(1/2)*erfc(sqrt(3*4*EbNo/(16-1))/sqrt(2)),'gs-','LineWidth',2);
hold on
semilogy(EbNodB,(4/2)*(1-1/sqrt(4))*(1/2)*erfc(sqrt(3*2*EbNo/(4-1))/sqrt(2)),'bs-','LineWidth',2);
axis([0 25 10^-6 1])
grid on
legend('QAM 64', 'QAM 16','QAM 4');
xlabel('Eb/No, dB')
ylabel('Bit Error Rate')
title('Bit error probability curve for 16-QAM modulation')
hold off

%---------------------------------------------------------------%

end