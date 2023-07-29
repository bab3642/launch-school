def find_dup(array)
  num = nil
  array.each_with_index do |number_a, index|
    array.each do |number_b|
      num = number_a if number_a == number_b && array.index(number_b) != index
    end
  end
  num
  # array.each_with_index do |number, index|
  #   loop do
      
  #  end
end

def find_dup2(array)
  array.each_with_index do |number, index|
    loop do
      index += 1
      break if index == array.length
      return number if number == array[index]
    end
  end
end



# Unordered array. ONE value in the array occurs twice. 
# num 1 index 0 
# num = 1 if 1 == 1 && 0 != 0
# num 5 index 1
# num = 5 if 5 == 1
# of 5 == 5 and 1 != 0
# Find the duplicate value (return it)

p find_dup2([1, 5, 3, 1]) # == 1
p find_dup2([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
          
# D: Array 
# A: Selet for the that value 
# Nesting iterations
# IF THE INDEX IS THE SAME< THEN THEY DON"T MATCH
# return the number that matched.

