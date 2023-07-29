def integer_to_string(num)
  num.digits.reverse.join
end


# take integer as argument
# return a string 

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# data: array, string
# Algo: get digits of number
# Put digits in array, join the array together