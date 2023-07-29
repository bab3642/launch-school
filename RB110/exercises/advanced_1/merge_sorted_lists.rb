def merge(arr1, arr2)
  new_arr = []
  arr1_idx = 0
  arr2_idx = 0
  loop do
    if arr1.empty? 
      return arr2
    elsif arr2.empty? 
      return arr1
    elsif arr1_idx >= arr1.size
      new_arr << arr2[arr2_idx..-1]
      break
    elsif arr2_idx >= arr2.size
      new_arr << arr1[arr1_idx..-1]
      break
    elsif arr1[arr1_idx] >= arr2[arr2_idx]
      new_arr << arr2[arr2_idx] 
      arr2_idx += 1
    elsif arr1[arr1_idx] < arr2[arr2_idx]
      new_arr << arr1[arr1_idx]
      arr1_idx += 1
    end
  end
  new_arr.flatten  
end

# take two sorted arrays of ANY SIZE as argument. Return a NEW array that contains ALL elements from
# both arguments in SORTED order. 

# may NOT sort the result array
# do NOT mutate the input arrays


p merge([1, 5, 9], [2, 6, 8])  == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# Arrays

#
# Then I will create an arr1 index and arr2 index.

# The smallest element gets added to the empty array and the index for that array
# is increased. Then continue comparing.
