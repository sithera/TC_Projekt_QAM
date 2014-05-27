function [ string_recived ] = string_output( bit_array )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

string_recived = char(bin2dec(reshape(char('0' + bit_array),8,[]).'))' % odwrotna konwersja

end

