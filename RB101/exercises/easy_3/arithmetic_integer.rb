puts "Enter the first number:"
num1 = gets.chomp.to_i # could do to_f instead

puts "Enter the second number:"
num2 = gets.chomp.to_i # could do to_f instead

addition = num1 + num2
subtraction = num1 - num2
multiplication = num1 * num2
division = num1 / num2
modulo = num1 % num2
power_of = num1 ** num2

puts "#{num1} + #{num2} = #{addition}"
puts "#{num1} - #{num2} = #{subtraction}"
puts "#{num1} * #{num2} = #{multiplication}"
puts "#{num1} / #{num2} = #{division}"
puts "#{num1} % #{num2} = #{modulo}"
puts "#{num1} ** #{num2} = #{power_of}"