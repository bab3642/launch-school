CHARACTERS = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6, 
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}


def string_to_integer(string)
  characters = string.chars
  characters.map! do |char|
    CHARACTERS[char]
  end
  number = 0
  characters.each do |num|
    number = number * 10 + num
  end
  number
end

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570


# 1 - 1 
# 2 - 10
# 3 - 100
# 4 - 1000

def hex_to_integer(string)
  characters = string.upcase.chars
  characters.map! do |char|
    CHARACTERS[char]
  end
  number = 0
  characters.each do |num|
    number = number * 16 + num
  end
  number
end

p hex_to_integer('4D9f')