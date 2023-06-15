def repeat(string, pos_int)
  num = 0
  while num < pos_int
    puts string
    num += 1
  end
end

repeat("purple", 3)
repeat("orange", -1)
repeat("hi", 20)

=begin

def repeat(string, number)
  number.times do
    puts string
  end
end

=end
