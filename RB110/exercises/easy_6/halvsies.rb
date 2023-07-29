def halvsies(array)
  first_half = []
  second_half = []
  length = array.size
  length += 1 if length % 2 == 1
  (length / 2).times { first_half << array.shift }
  second_half << array
  [first_half, second_half.flatten]
end

# takes 1 array argument
# returns two arrays ( as a PAIR of NESTED arrays)
# First half and second half of the array
# If it is odd, the middle element placed in the first HALF of the array

p halvsies([1, 2, 3, 4]) # == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Array
# get the length of the array
# see if length is odd
# if length is odd, have to add one to the iteration
# 
