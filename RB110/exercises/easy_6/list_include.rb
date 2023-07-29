def include?(array, value)
  array.each do |element|
    return true if element == value
  end
  return false
end

# takes an array and search value. Returns TRUE if thesearch value is in the array
# false if it is not
# may not use include.

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false