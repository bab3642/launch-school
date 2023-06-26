def stringy(int)
  i = 0
  string = ""
  while i < int
    if i.odd? 
      string << "0"
    else
      string << "1"
    end
    i += 1
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=begin
def stringy2(int)
  numbers = []
  
  int.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end
  
  numbers.join
end
=end

def modified_stringy(int, start = 1)
   numbers = []
  
  if start == 1  
    int.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  elsif start == 0
    int.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  end
  numbers.join
end