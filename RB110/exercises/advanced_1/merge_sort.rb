require 'pry'

def merge_sort(array)
  length = (array.size / 2)
  return array if array.size == 1
  array1, array2 = array[0..(length - 1)], array[length..-1]
  binding.pry
  array1 = merge_sort(array1) 
  array2 = merge_sort(array2) 

  merge(array1, array2)
end

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



# Break array down into nested sub-arrays
# merge subarrays together then sort them
# As they join they are sorted

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

# [1,2,3,4,5]
# [1,2][3,4][5]

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]