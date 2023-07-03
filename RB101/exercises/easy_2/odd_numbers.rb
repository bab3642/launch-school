(1..99).each do |num|
  puts num if num.odd?
end


nums = (1..99).to_a.select { |num| num.odd? }
puts nums
