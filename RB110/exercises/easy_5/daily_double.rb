require 'pry'

def crunch(string)
  return string if string.empty?
  index = 0
  loop do
    length = string.length
    if string[index] == string[index + 1]
      string[index + 1] = ''
      #binding.pry
      next
    else
      index += 1
      break if index >= length - 1

    end
  end
  string
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''