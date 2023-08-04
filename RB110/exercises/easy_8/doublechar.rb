def double_consonants(string)
  new_string = ''
  (0...string.length).each do |num|
    new_string << string[num]
    new_string << string[num] unless %w(a e i o u).include?(string[num].downcase) || string[num].match?(/[^a-z]/i)
  end
  new_string
end


# Return a NEW string where every string is doubled

# Range objec up to string length - 1
# Index string and add it to new string
# Display

# p repeater('Hello')  == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th")  == "JJullyy 4tthh"
p double_consonants('') == ""