def oddities(arr, even = false)
  odd_indexes = []
  num = (even ? 0 : 1)
  (num...arr.size).step(2) { |idx| odd_indexes << arr[idx] }
  odd_indexes
end

def oddities2(arr)
  arr.select { |num| arr.index(num) % 2 == 0 }
end

def oddities3(arr)
  (0...arr.size).to_a.select { |num| num.even? }.map { |idx| arr[idx] }
end

p oddities3([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities3([1, 2, 3, 4, 5, 6]) # == [1, 3, 5]
p oddities3(['abc', 'def']) == ['abc']
p oddities3([123]) == [123]
p oddities3([]) == []
p oddities3([1, 2, 3, 4, 1]) == [1, 3, 1]

