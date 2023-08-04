


# Explicit : PRINT out groups of words that are anagrams (in an array form)
# Print out new array for each anagram collection
# 

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
anagrams = []

words.each do |word|
  anagrams << words.select { |gram| word.chars.sort == gram.chars.sort }
end
          
anagrams.map!(&:sort).uniq!.each { |list| p list }


          
          
# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

# Make an array
# Array of arrays of anagrams
# sort them
# array.uniq
