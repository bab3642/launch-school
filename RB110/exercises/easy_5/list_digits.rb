def digit_list_2(num)
  num.digits.reverse
end

def digit_list(num)
  array = []
  loop do
    num = num.divmod(10)
    array << num.last
    num = num[0]
    break if num == 0
  end
  array.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => t