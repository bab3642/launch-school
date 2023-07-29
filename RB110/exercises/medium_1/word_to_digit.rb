# take a string sentence input, returns SAME string with any sequence of words for numbers converted
# to digits

#word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# I will use a hash to store values and convert them to numbers
# numbers can have space between them....
#Iterate thru the string word by word
# Turn into a number
# join the string together


NUMBERS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(sentence)
  words = sentence.split
  
  downcasers = words.map { |word| word.downcase }
  downcasers.each do |word|
    NUMBERS.each { |k, v| word.gsub!(k, v.to_s) }
  end
  
  index = -1
  words.map! do |word|
    index += 1
    if !NUMBERS.values.select { |val| downcasers[index].include?(val) }.empty?
      downcasers[index]
    else
      word
    end
  end
  words.join(" ").gsub!(/(?<=\d)\s(?=\d)/, '')
  
end

p word_to_digit('Please call me at Five Five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'