# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# 1  5  8
# 4  7  2
# 3  9  6

# 1  4  3
# 5  7  9
# 8  2  6
require 'pry'

def transpose(matrix)
  new_matrix = []
  matrix[0].size.times do |num|
    new_matrix << []
    matrix.each { |subarr| new_matrix[num] << subarr[num] }
  end
  new_matrix
end
  
def transpose!(matrix)
  up = [0, 1, 2]
  matrix.each_with_index do |subarr, index|
    up.each do |num|
      subarr[num], matrix[num][index] = matrix[num][index], subarr[num]
      # this would switch some things twice unless we shift off the first value of up. 
    end
    up.shift
  end
  matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose!(matrix)

# p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Data structure: arrays

# Algorithm:

# First and last elements of first and last arrays respectively stay the same. 
# second element of first array becomes the first element of the second array
# third element of first array becomes first element of third array

# first element of second array becomes second element of first array
# second element of second array STAYS the same
# third element of second array becomes second element of the third array

# first element of third array becomes third element of first array
# second element of third array becomes third element of second array
# third element of third array stays the same 


# We want to create two arrays that go from 0..2 (each_with_index)
# Iterate through each one three times, for each of the inner arrays in the matrix
# 