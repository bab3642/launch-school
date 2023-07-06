def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = words.length - 1
  while i >= 0
    reversed_words << words[i]
    i -= 1
  end

  reversed_words.join(' ').strip
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed_words = []

#   i = 0
#   while i < words.length
#     reversed_words = [words[i]] + reversed_words
#     i += 1
#   end

#   reversed_words.join(' ')
# end

# p reverse_sentence('how are you doing')
# # expected output: 'doing you are how'