# String Argument
# Return the SAME sequence of characters with every 2nd character in every THIRD word converted to uppercase

# Is it supposed to be the same string object??
# What if word doesn't have two characters?? 
# Can we assume all words are separated by a space? 
require 'pry'

def to_weird_case(sentence)
  words = sentence.split
  counter = 0
  words.map! do |word|
    counter += 1
    if counter % 3 == 0
       word.chars.each_with_index { |char, idx| char.upcase! if idx % 2 != 0}.join
    else
      word
    end
  end
  words.join(" ")
end



p to_weird_case('Lorem Ipsum is simply dummy text of the printing')  == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'


# Use a simple loop. First split the string up into words
# Iterate over it keeping track of which one I am on with a counter (or index)
# map


