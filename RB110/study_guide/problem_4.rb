# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# RETURN an ARRAY of the two integers that are the closest in value

# Are we modifying the original array? 
# What if the array is less than two integers long? Or empty? 
 
# Examples:
require 'pry'

def closest_numbers(array)
  indices = {}

  array.each_with_index do |number_a, num_a_idx|
    differences = []
    array.each do |number_b|
      differences << (number_a - number_b) unless number_a - number_b == 0
      indices[num_a_idx] = differences.map(&:abs).min
    end
  end
  arr = indices.sort_by { |k, v| v }.first(2)
  [array[arr[0][0]], array[arr[1][0]]]
end

p closest_numbers([5, 25, 15, 11, 20]) # == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

# Array - store the difference in values in another Array
# Hash to store the index of the number 


# Iterate over each number and find the smallest difference. The NUMBER with the smallest difference we need the index of that number. 