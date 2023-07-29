def word_cap(string)
  #words = string.split
  # words.map! { |word| word.capitalize }
  # words.join(" ")
  
  # words.map { |word| word[0].upcase + word[1..-1] }.join(" ")
  
  # string.match/\b\w/)
end

# return a NEW string

p word_cap('four score and seven') # == 'Four Score And Seven'
p word_cap('the javaScript language') # == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'




