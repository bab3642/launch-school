def cleanup(words)
  words.gsub(/[^a-z]+/i, ' ')
end

p cleanup("---what's my +*& line?")


CHARACTERS = ('a'..'z').to_a # + ('A'..'Z').to_a 
# made irrelevant by calling downcase on line 14

def cleanup_no_regex(words)
  index = 0
  length = words.length
  loop do
    words[index] = ' ' if !CHARACTERS.include?(words[index].downcase)
    index += 1
    break if index == length
  end
  words.squeeze(' ')
end

p cleanup_no_regex("---what's my +*& line?")