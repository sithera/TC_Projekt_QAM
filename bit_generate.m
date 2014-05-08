function [ random_bits ] = bit_generate(  )
%Funkcja generuj¹ca ci¹g losowych bitów

M = 16;                     % Rozmiar konstelacji
k = log2(M);                % Liczba bitów na symbol
n = 64;                     % Liczba bitów do przes³ania

random_bits = randi([0 1], 1, n);  %wygenerowanie losowych bitow


end

