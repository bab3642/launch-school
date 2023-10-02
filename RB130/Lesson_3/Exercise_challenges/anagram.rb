# Take a WORD and a LIST of possible anagrams
# Select the CORRECT sublist that contains the anagrams of the word

# The letters CANNOT be repeated
# Array ( delete from array )
#



# I could first take a word and find ALL possible anagrams then compare it against
# the list


# Or I could iterate through each character of the list and if the character is
# included in the word, delete that character and keep going OR if the counts match keep going
# If I run into a character that is NOT included in the word, then skip to the next
# one - this is more efficient

# Or i can just turn both into an array of characters and sort them and see if they are equal...
# That is probably easier


class Anagram
  def initialize(string)
    @word = string
  end

  def match(array)
    result = []
    array.each do |word|
      result << word if word.downcase.chars.sort == @word.downcase.chars.sort &&
      @word.downcase != word.downcase
    end
    result
  end
end