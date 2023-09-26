

def reduce(array, opt = nil)
  if opt
    array.each do |element|
      opt = yield(opt, element)
    end
  else
    opt = array[0]
    array[1..-1].each do |element|
      opt = yield(opt, element)
    end
  end

  opt
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
