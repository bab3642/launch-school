def find_fibonacci_index_by_length(num)
  fibonacci_nums = [1, 1]
  start = 1
  loop do
    fibonacci_nums << fibonacci_nums[start] + fibonacci_nums[start - 1]
    start += 1
    break if num >= fibonacci_nums.last.digits.size
  end
  fibonacci_nums.length
end



# Return the INDEX of the fibonacci series by the LENGTH of the number (tens places)
# 

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# Data structure = Array. must have an array of the fibonacci numbers
# compare the length of each number in the array to the number specified in the method call
# return the INDEX where the length matches

# Do the first fibonacci sequence. Iterate through the array. If the number specified in the method call matches the length
# If it does not match, move on to the next iteration of the fib sequence.
# Repeat until it matches. 