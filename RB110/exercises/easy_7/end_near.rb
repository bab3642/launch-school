def penultimate(string)
  string.split[-2]
end

#next to last WORD in string

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(string)
  return string if string.split.size <= 1
  words = string.split
  size = words.size
  if size.even?
    words[(size / 2) - 1]
  else
    words[size / 2]
  end
end

# no words
# 1 word
# even number of words

p middle_word("there are")
p middle_word("There is a middle word")
p middle_word('')
p middle_word('hello"')