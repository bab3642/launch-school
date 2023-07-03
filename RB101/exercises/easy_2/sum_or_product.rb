def sum_integers(integer)
  (1..integer).inject(:+)
end

def product_integers(integer)
  (1..integer).inject(:*)
end






puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product"
operator = gets.chomp


if operator == 's'
  sum = sum_integers(integer)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif operator == 'p'
  product = product_integers(integer)
  puts "The product of the integers between 1 and #{integer} is #{product}"
end


