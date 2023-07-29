def ascii_value(string)
  sum = 0
  string.each_char do |character|
    sum += character.ord
  end
  sum
end

#get ascii value of string
# ascii value of each character
# 

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# D: iteration
# iterate through array saving the total value of each character
# return the value
# .ord.chr