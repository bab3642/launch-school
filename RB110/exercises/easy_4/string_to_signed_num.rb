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


# def string_to_signed_integer(string)
#   if string[0] == '+' || string[0] == '-'
#     sign = string.slice!(0)
#   end
#   characters = string.chars
#   characters.map! do |char|
#     CHARACTERS[char]
#   end
#   number = 0
#   characters.each do |num|
#     number = number * 10 + num
#   end
#   sign == '-' ? -number : number
# end

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

#further exploration
def string_to_signed_integer(string)
  if ['-', '+'].include?(string[0])
    sign = string[0]
    string = string[1..-1]
  end
  num = string_to_integer(string)
  sign == '-' ? -num : num
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100