function [ random_bits ] = bit_generate(  )
%Funkcja generuj�ca ci�g losowych bit�w

n = inputdlg(sprintf('Podaj liczb� paczek bit�w do wys�ania:  \n             (Jedna paczka = 4 bity) \n\nUWAGA! Przy podaniu zbyt du�ej liczby,\nsymulacja mo�e trwa� na prawd� d�ugo'), 'QAM');        
                                        % Liczba bit�w do przes�ania
n = 4*(str2num(cell2mat(n)));
M = 16;                                 % Rozmiar konstelacji
k = log2(M);                            % Liczba bit�w na symbol                     

random_bits = randi([0 1], 1, n);       % Wygenerowanie losowych bitow


end

