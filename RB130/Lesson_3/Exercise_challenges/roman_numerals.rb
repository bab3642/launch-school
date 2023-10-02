# class RomanNumeral
#   def initialize(num)
#     @year = num
#   end

#   def to_roman
#     thousands(@year) + hundreds(@year) + tens(@year) + ones(@year)
#   end

#   def thousands(year)
#   'M' * (year / 1000)
#   end

#   def hundreds(year)
#     hundreds = year % 1000 / 100
#     case hundreds
#     when 9
#       'CM'
#     when (5..8)
#       'D' + ('C' * (hundreds - 5))
#     when 4
#       'CD'
#     else
#       'C' * hundreds
#     end
#   end

#   def tens(year)
#     tens = year % 100 / 10
#     case tens
#     when 9
#       'XC'
#     when (5..8)
#       'L' + ('X' * (tens - 5))
#     when 4
#       'XL'
#     else
#       'X' * tens
#     end
#   end

#   def ones(year)
#     ones = year % 10
#     case ones
#     when 9
#       'IX'
#     when (5..8)
#       'V' + ('I' * (ones - 5))
#     when 4
#       'IV'
#     else
#       'I' * ones
#     end
#   end

#   # def convert(hash, divider)
#   #   var = (@year % divider[hash[0]] / divider[hash[1]])
#   #   case var
#   #   when 9
#   #     hash[9]
#   #   when (5..8)

#   #   when


#   #   end
#   # end
# end



# THOUSANDS = {
#   1 => 'M'
# }

# HUNDREDS = {
#   1 => 'C',
#   5 => 'D'
# }

# TENS = {
#   1 => 'X',
#   5 => 'L'
# }

# ONES = {
#   1 => 'I',
#   5 => 'V'
# }

# MULTIPLIER = {
#   THOUSANDS => [10000, 1000],
#   HUNDREDS => [1000, 100],
#   TENS => [100, 10],
#   ONES => [10, 1]
# }

# # I need to convert number to roman numeral
# # Take modulo 10 / 100 / 1000 (no need to go higher than 3000)
# # then convert the digit to the appropriate roman numeral.
# # hash for tens, hundreds, thousands.
# # If i can figure out a way to place the number in FRONT of it is a 4 or 9
# # then


class RomanNumeral
  attr_reader :number

 ROMAN_NUMERALS = {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000,
}

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    conv_numbers = ROMAN_NUMERALS.values.sort! { |a, b| b <=> a }
    conv_numbers.each do |value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (ROMAN_NUMERALS.key(value) * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end