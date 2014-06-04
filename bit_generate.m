function [ random_bits ] = bit_generate( wart, ber )
%Funkcja generuj¹ca ci¹g losowych bitów
if log2(wart) == 6
    poprawne = 'bitów';
else
    poprawne = 'bity';
end

if ber == 0
   n = inputdlg(sprintf(['                      SYMULACJA\n\nPodaj liczbê paczek bitów do wys³ania:  \n             (Jedna paczka = ' num2str(log2(wart)) ' ' poprawne ') \n\nUWAGA! Przy podaniu zbyt du¿ej liczby,\nsymulacja mo¿e trwaæ na prawdê d³ugo']), 'QAM'); 
else
    n = inputdlg(sprintf(['                 OBLICZANIE BER \n\nPodaj liczbê paczek bitów do obliczenia\n                     Bit Error Rate:  \n             (Jedna paczka = ' num2str(log2(wart)) ' ' poprawne ') \n\nUWAGA! Przy podaniu zbyt du¿ej liczby,\nsymulacja mo¿e trwaæ na prawdê d³ugo']), 'QAM');
end

% Liczba bitów do przes³ania
n = log2(wart)*(str2num(cell2mat(n)));

random_bits = randi([0 1], 1, n);       % Wygenerowanie losowych bitow


end

