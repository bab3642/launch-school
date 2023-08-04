def move(n, from_array, to_array)
  to_array << from_array.shift
  return to_array if n <= 1
  move(n - 1, from_array, to_array) # 
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# System stack error means that there is an endless loop somewhere. The stack is full
# To fix this, we need to change line 3 in the method. 