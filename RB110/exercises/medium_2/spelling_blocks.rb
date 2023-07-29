# two letters per block
# each block can only be used ONCE
# return TRUE if the word passed in can be spelled from blocks
# FALSE if it cannot



# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

require 'pry'


def block_word?(word)
  blocks = []
  %w(b x d c n g r f j h v l z).each { |ltr| blocks << [ltr] }
  %w(o k q p a t e s w u i y m).each_with_index { |ltr, idx| blocks[idx] << ltr }
  
  word.each_char do |char|
  matching_block = blocks.select { |block| block.include?(char.downcase) }
    if !matching_block.empty?
      blocks.delete(matching_block.flatten)
      # binding.pry
    else
      return false
    end
  end
  
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# Implicit: CASE does not matter

# Data : arrays
# Algorithm
  # Initialize an array with nested arrays of blocks.
  
  # Iterate through each letter of the word and each block
  # If the letter is found in a block, remove that block from the array and move 
  #   onto the next letter. Make sure when continuing my iteration the block array
  #   is removed.
  # If the letter is NOT found in any block, return false