

# One argument, array of ints
# RETURN the MINIMUM SUM OF 5 CONSECUTIVE NUMS in the Array
# Explicit: Return nil if the array is smaller than 5 elements


# Examples:

def minimum_sum(array)
  return nil if array.size < 5
  range_limit = 4
  index = 0
  sums = []
  array.each do |num|
    if range_limit < array.length
      sums << array[index..range_limit].sum
      range_limit += 1
      index += 1
    end
  end
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) # == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

# I could create a range limit and work throgh that
# Push the sum to the Array
# return the lowest value in the array. 