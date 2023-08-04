def reverse_words(string)
  words = string.split
  words.map! do |word|
    if word.size > 4
      word.reverse
    else
      word
    end
  end
  words.join(" ")
end


# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
# Return a NEW string with the words in reverse order

# Array 

# Split the string into words (array)
# Reverse the array
# Return the words with spaces in between. 

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS