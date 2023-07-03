require 'pry'
def center_of(string)
  length = string.size
  letter = string[length / 2]
  letter2 = string[(length / 2) - 1]
  return letter if length.odd?
  letter2 + letter
end
  
  
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

=begin def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end
=end
