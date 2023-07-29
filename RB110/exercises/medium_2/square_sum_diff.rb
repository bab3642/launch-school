# diff between SQUARE of the SUM of the first n pos integers 
# and the sum of the squares of the first N positive integers

def sum_square_difference(num)
  nums = 1.upto(num).to_a
  nums.inject(:+)**2 - (nums.reduce { |sum, n| sum + n**2 })
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# array, inject method


