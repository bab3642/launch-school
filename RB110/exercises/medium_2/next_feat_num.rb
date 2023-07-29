# featured num is an ODD number that is a multiple of 7,  digits occur exactly 1 time each
# we want to return the NEXT featured number that is GREATER than the argument.

def featured(num)
  
  loop do
    num += 1
    break if num % 7 == 0
  end
  loop do
    break if num.odd? && num.digits == num.digits.uniq
    num += 7
    return "ERROR: There is NO next featured number" if num > 9999999999
  end
  num
end


p featured(12) == 21
p featured(20) == 21
p featured(21)  == 35
p featured(997) == 1029
p featured(1029)  == 1043
 p featured(999_999) == 1_023_547
 p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# arrays

# First time increment by one up to 7 ( % & == 0)
# Then we will add multiples of 7 until we find an odd number
# Then we will check the odd number to see if the digits are unique

# How do I know what the max featured number is?  I guess if it is more than 10 digits
# Return an error.....