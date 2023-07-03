puts "Please input a word or multiple words:"
input = gets.chomp

characters = input.delete(" ")
puts "There are #{characters.length} characters in: #{input}"