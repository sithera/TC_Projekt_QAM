function [ random_bits ] = bit_generate(  )
%Funkcja generuj¹ca ci¹g losowych bitów

n = inputdlg(sprintf('Podaj liczbê paczek bitów do wys³ania:  \n             (Jedna paczka = 4 bity) \n\nUWAGA! Przy podaniu zbyt du¿ej liczby,\nsymulacja mo¿e trwaæ na prawdê d³ugo'), 'QAM');        
                                        % Liczba bitów do przes³ania
n = 4*(str2num(cell2mat(n)));
M = 16;                                 % Rozmiar konstelacji
k = log2(M);                            % Liczba bitów na symbol                     

random_bits = randi([0 1], 1, n);       % Wygenerowanie losowych bitow


end

