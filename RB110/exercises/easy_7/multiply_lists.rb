def multiply_list(arr1, arr2)
  # index = -1
  # arr1.map do |num|
  #   index += 1
  #   num * arr2[index]
  # end
  arr1.zip(arr2).map { |subarray| subarray.inject(:*) }
end

# NEW array returned
# Product of each pair of numbers from the arguments that have the same index.....

p multiply_list([3, 5, 7], [9, 10, 11])  == [27, 50, 77]