def diamond(integer)
  spaces = integer
  (integer / 2).times do 
    puts (" " * (spaces / 2)) + ("*" * (integer - (spaces - 1)))
    spaces -= 2
  end
  
  puts "*" * integer
  spaces = 2
  (integer / 2).times do 
    puts (" " * (spaces / 2)) + ("*" * (integer - (spaces)))
    spaces += 2
  end
end

diamond(9)
diamond(1)
diamond(3)