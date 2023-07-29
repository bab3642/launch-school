def multiply_all_pairs(arr1, arr2)
  array = []
  if arr2.length > arr1.size
    arr1.each do |num|
      arr2.size.times { |idx| array << num * arr2[idx] }
    end
  else
    arr2.each do |num|
      arr1.size.times { |idx| array << num * arr1[idx] }
    end
  end
  array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]