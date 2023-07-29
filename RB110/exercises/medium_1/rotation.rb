# def rotate_array(array)
#   new_array = array.map { |val| val }
#   new_array << new_array.shift
#   new_array
# end
require 'pry'

#Move first element to the end of the array. ORIGINAL ARRAY SHOULD NOT BE MODIFIED

# p rotate_array([7, 3, 5, 2, 9, 1]) # == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

#store first value of array in something. Append it to a new array. 

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_integer(int)
  int = rotate_array(int.digits.reverse).join.to_i
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

def rotate_rightmost_digits(int, n)
  size = int.size
  return rotate_array(int) if n == size
  # loop do
  #   break if n < size
  #   n = n - size
  # end
  array = int
  rotate_num = array[-n]
  array.delete_at(-n)
  array << rotate_num
  array
end

def max_rotation(num)
  num = num.digits.reverse
  length = num.size
  length.times do |index| 
    num = rotate_rightmost_digits(num, length)
    length -= 1
    binding.pry
  end
  num.join.to_i
end

# p max_rotation(735291)  == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10007)


#our return value will be a number (the maximum rotation)

# p rotate_string("testing")
# p rotate_integer(1234)






# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# rotate digits - 12345, 1 = 12345
# 12345, 2 = 12354
# 12345, 3 = 12543
# 4 = 15432
# 5 = 54321


# 12345  -- 5
# 23451 -- 4
# 24513 -- 3 
# 24135
# 24153

# to conserve zeroes, use an array. Got to check if the class is an array first or an integer
# Then rotate the array as follows. Then final time, return the array as an integer. 