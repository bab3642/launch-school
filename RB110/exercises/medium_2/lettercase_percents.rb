require 'pry'

def letter_percentages(string)
  hash = {}
  hash[:lowercase] = ((string.count('a-z') / string.length.to_f) * 100).round(1)
  hash[:uppercase] = ((string.count('A-Z') / string.length.to_f) * 100).round(1)
  hash[:neither] = ((string.count('^a-zA-Z') / string.length.to_f) * 100).round(1)
  hash
end

p letter_percentages('abCdef 123')  == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')