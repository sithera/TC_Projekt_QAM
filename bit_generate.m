function [ random_bits ] = bit_generate(  )
%Funkcja generuj�ca ci�g losowych bit�w

M = 16;                     % Rozmiar konstelacji
k = log2(M);                % Liczba bit�w na symbol
n = 64;                     % Liczba bit�w do przes�ania

random_bits = randi([0 1], 1, n);  %wygenerowanie losowych bitow


end

