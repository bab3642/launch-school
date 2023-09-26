[1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]

[1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]


def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end