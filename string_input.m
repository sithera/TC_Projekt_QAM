function [bit_array, word] = string_input()

% Funkcja zamieniaj�ca podane przez u�ytkownika tekst na ci�g bit�w.
% Odwrotna konwersja w komentarzu, przyda si� p�niej

word = inputdlg('Podaj tekst do wys�ania: ', 'QAM')         % wywo�anie okna dialogowego 

word_bin = dec2bin(char(word),8)  ;                         % zamiana cell na char-bin, ka�dy znak zapisany jest na 8 bitach

for i = 1:size(word_bin,1)                                  % zamiana char-bin na matrix-bin gdzie
    for j = 1:size(word_bin,2)                              % ka�da kolumna to 1 bit
        word_out(1,(i-1)*size(word_bin,2)+j) = str2num(word_bin(i,j));
    end
end
bit_array = word_out;
end


