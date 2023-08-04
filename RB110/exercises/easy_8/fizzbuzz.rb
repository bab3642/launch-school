def fizzbuzz(startnum, endnum)
  arr = []
  startnum.upto(endnum) do |num|
    arr << whattoprint(num)
  end
  puts arr.join(", ")
end


def whattoprint(num)
  if (num % 5 == 0) && (num % 3 == 0)
    "FizzBuzz"
  elsif num % 3 == 0
    "Fizz"
  elsif num % 5 == 0
    "Buzz"
  else
    num
  end
end
# $ Print all nums from start to num EXCEPT if num is % 3, print Fizz
# $ if % 5 print Buzz
# if %3 and %5, FizzBuzz!

# Range object and each method

#Algorithm

# Create my range (an array of numbers from startnum to endnum)
# Iterate over the range and print the number
# Conditional statement

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz