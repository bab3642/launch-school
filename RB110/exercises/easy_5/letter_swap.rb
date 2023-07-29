def swap(string)
  words = string.split(" ")
  words.map! do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  
  words.join(" ")
    
end

p swap('Oh what a wonderful day it is') # == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'