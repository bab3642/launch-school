def swapcase(string)
  new_string = ''
  string.each_char do |character|
   if character.upcase == character
     new_string << character.downcase 
   else
     new_string << character.upcase
   end
  end
  new_string
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'