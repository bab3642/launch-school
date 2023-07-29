def integer_to_string(num)
  num.digits.reverse.join
end

def signed_integer_to_string(num)
  string = integer_to_string(num.abs)
  if num < 0
    string.prepend('-')
  elsif num > 0
    string.prepend('+')
  end
  string
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'