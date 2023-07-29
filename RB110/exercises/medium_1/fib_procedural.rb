# def fibonacci(n)
#   count = 2
#   fib_array = [1, 1]
#   return 1 if n == 1 || n == 2
#   loop do
#     count += 1
#     fib_array << fib_array.sum 
#     fib_array.shift
#     break if count >= n
#   end
#   fib_array.last
# end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) 

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

def fibonacci_last(n)
  num = n % 60
  return 0 if num == 0
  last_2 = [1, 1]
  3.upto(num) do 
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end

# p fibonacci_last(15)
# p fibonacci_last(16)
# p fibonacci_last(17)
# p fibonacci_last(18)
p fibonacci_last(15)# -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123456789987745)

# Every 15th number will be a 0

# 1 -1 
# 1 -2
# 2 -3
# 3 -4
# 5 -5
# 8 -6
# 13 -7
# 21 -8
# 34 -9
# 55 -10

# every 14 - pattern repeats with a zero
# first number after zero - 
# 1 (THIS NUMBER REPEATS TWICE)
# 7
# 9
# 3

# 1
# 7
# 9
# 3

# Next number after this
# 2
# 4
# 8
# 6

# 2
# 4

