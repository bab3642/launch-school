# Read the content of a text file the print the longest sentence in the file
# Sentence ends with . ! or ?
# any non-space or non sentence ending character is treated as a word
# print the number of words too
def longest_sentence(text)
  sentences = text.split(/(?<=\.) *|(?<=\?) *|(?<=!) */)
  sentences.sort_by! { |sentence| sentence.split.size }
  puts sentences.last.strip
  puts "There are #{sentences.last.split.size} words in the longest sentence"
end

def longest_paragraph(text)
  paragraphs = text.split(/\n\n/)
  largest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  largest_paragraph = largest_paragraph.strip
  num_of_words = largest_paragraph.split.size
  
  puts largest_paragraph
  puts "There are #{num_of_words} words in the largest paragraph"
end

def longest_word(text)
  words = text.split(/[\.\?! \-\n]/)
  longest_word = words.max_by { |word| word.length }
  puts "The longest word is #{longest_word.strip} with a length of #{longest_word.length}."
end


text = File.read('sentences.txt')

longest_sentence(text)

longest_paragraph(text)

longest_word(text)

#Load the txt file
# Split the file by .
# Iterate over each word and split by !
# Iterate over each one and split by ?
# Iterate over each one and return the longest.

# What is a paragraph defined by? Newline character? 

