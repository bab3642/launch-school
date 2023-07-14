NUMBER_ENDINGS = {
  st: [1],
  nd: [2],
  rd: [3],
  th: [4, 5, 6, 7, 8, 9, 0]
}


def century(year)
  century_num = get_century(year)
  century_ending = get_ending(century_num)
  
  century_num.to_s + century_ending
end


def get_century(year)
  arr = year.divmod(100)
  if arr[1] == 0
    year = arr[0]
  else
    year = arr[0] + 1
  end
end

def get_ending(num)
  unless num.digits[1] == 1
    num = num.digits.first
    ending = NUMBER_ENDINGS.select do |_, v|
            v.include?(num)
            end
    ending.keys.first.to_s
  else
    "th"
  end
end
  
    

# Take a year as input
# Return a STRING that begins with the century number
# String should END with appropriate ending for that number
# Century begins on 1st year (1-100 is 1st century)
 
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
 
# Data structures:
#   Array, hash for endings, string for returning
  
# Algorithm:
# GET the century year
# GET the century year number ending
# Turn both into a string
# Concatenate them together

# Get the century year:
#   divide by 100
#   if remainder is 0, then it is still the previous century, otherwise it is the
#     next century of the returned result.

# Get century year number ending:
# =>  select the hash key that has the value of the last number
# => Turn hash key into a string

