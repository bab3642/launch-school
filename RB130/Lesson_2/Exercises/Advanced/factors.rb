factorial = Enumerator.new do |yielder|
  number = 0
  accumulator = 1
  loop do
    accumulator = (number > 0 ? number * accumulator : 1)
    yielder << accumulator
    number += 1
  end
end


7.times {puts factorial.next}
factorial.rewind
puts factorial.take(7)


factorial.each_with_index do |factor, idx|
  puts "#{idx}! : #{factor}"
  break if idx > 6
end