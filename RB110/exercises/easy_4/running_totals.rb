# Array of numbers
# Returns an array with the same number of ELEMENTS and each element has a running total from the original array

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

#Data structure: Arrays

#Algorithm:
# Take the array
# Iterate over each element and SUM everything up to that element
# push the sum to a new array

# def running_total(array)
#   sum = []
#   array.each_with_index do |_, index|
#     sum << array[0..index].sum 
#   end
#   sum
# end

def running_total(array)
  array.each_with_object([]) do |element, summed_array|
    summed_array << array[0..array.index(element)].sum
  end
end


p running_total([2, 5, 13])  == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []