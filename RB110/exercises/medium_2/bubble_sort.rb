# Take an array as an argument 
# Sort THAT array using teh bubble sort algorithm
# array contains at least 2 elements
# mutate the array

require 'pry'

# def bubble_sort!(array)
#   flip_switch = nil
#   array.each_with_index do |element, index|
#     if (element <=> array[index + 1]) == 1
#       array[index], array[index + 1] = array[index + 1], array[index]
#       flip_switch = true
#     end
#   end
#   return array unless flip_switch
#   bubble_sort!(array)
# end

# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


def bubble_sort_optimized!(array)
  counter = 0
  loop do
    swapped = false
    # counter subtracts 'n' tail elements to look at
    1.upto(array.size - (1 + counter)) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
     # binding.pry to count how many times this iterates
    end
    counter += 1
    break unless swapped
  end
  array
end

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort_optimized!(array)

array = [6, 2, 7, 1, 4]
p bubble_sort_optimized!(array)

# Arrays. <=>

# We will be comparing strings AND numbers. <=> will be needed

# Iterate over the array. If elements need to be swapped, flip a switch to true
# Continue iterating and swapping
# If switch does NOT get flipped, return the array. 