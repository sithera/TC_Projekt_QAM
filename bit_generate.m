function [ random_bits ] = bit_generate( wart, ber )
%Funkcja generuj�ca ci�g losowych bit�w
if log2(wart) == 6
    poprawne = 'bit�w';
else
    poprawne = 'bity';
end

if ber == 0
   n = inputdlg(sprintf(['                      SYMULACJA\n\nPodaj liczb� paczek bit�w do wys�ania:  \n             (Jedna paczka = ' num2str(log2(wart)) ' ' poprawne ') \n\nUWAGA! Przy podaniu zbyt du�ej liczby,\nsymulacja mo�e trwa� na prawd� d�ugo']), 'QAM'); 
else
    n = inputdlg(sprintf(['                 OBLICZANIE BER \n\nPodaj liczb� paczek bit�w do obliczenia\n                     Bit Error Rate:  \n             (Jedna paczka = ' num2str(log2(wart)) ' ' poprawne ') \n\nUWAGA! Przy podaniu zbyt du�ej liczby,\nsymulacja mo�e trwa� na prawd� d�ugo']), 'QAM');
end

% Liczba bit�w do przes�ania
n = log2(wart)*(str2num(cell2mat(n)));

random_bits = randi([0 1], 1, n);       % Wygenerowanie losowych bitow


end

