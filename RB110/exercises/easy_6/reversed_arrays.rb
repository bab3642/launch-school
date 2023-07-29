def reverse(list)
  index = 0
  reversed = list.map do |_|
    index -= 1
    list[index]
  end
  reversed
end


def reverse2(list)
  list.each_with_object([]) do |element, array|
    array.unshift(element)
  end
end

def reverse!(list)
  reversed = []
  length = list.length
  length.times { reversed << list.pop }
  length.times { list << reversed.shift }
  list
end

# list = [1,2,3,4]
# result = reverse!(list)
# p result ==  [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# p list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# p list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# p list = []
# p reverse!(list) == [] # true
# p list == [] # true

# part 2

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

