
# Check for valid triangle:
# lengths of two shortest sides must be greater than length of longest sides
# all sides must have lengths greater than 0

# Triangle type:
# all 3 sides equal - equilateral
# 2 sides equal - isosceles
# all 3 sides diff - scalene


# Takes 3 sides and returns a SYMBOL 

def triangle(n1, n2, n3)
  arr = [n1, n2, n3].sort
  return :invalid unless valid_triangle?(arr)
  if arr[0] == arr[1] && arr[1] == arr[2]
    :equilateral
  elsif arr[0] == arr[1] || arr[2] == arr[0] || arr[1] == arr[2]
    :isosceles
  else
    :scalene
  end
end

def valid_triangle?(arr)
  return false if !arr.select { |num| num == 0 }.empty? # arr.inject(:*) <= 0 
  (arr[0] + arr[1]) > arr[2]
end

# Examples
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Data structure:
# Array to store triangle sides


# First check if triangle is a real/valid triangle (check for sides 0 or less)
# If valid triangle, sort the array
# Iterate through the array and compare to determine triangle type


