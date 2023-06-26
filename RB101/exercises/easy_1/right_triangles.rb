def triangle(n)
  count = n
  loop do
    break if count <= 0
    spaces = "#{' ' * (count - 1)}"
    stars = "#{"*" * (n - spaces.size)}"
    puts spaces + stars
    count -= 1
  end
end

triangle(5)
triangle(9)
triangle(1)
triangle(0)

def triangle2(n)
  count = n - 1
  loop do
    break if count < 0
    num_stars = n - count
    puts "#{"*" * num_stars}".rjust(n)
    count -= 1
  end
end

triangle2(5)
triangle2(0)
triangle2(1)
triangle2(9)

def triangle3(n)
  n.times do |idx|
    puts "#{"*" * (n - (n - (idx + 1)))}".rjust(n)
  end
end



triangle3(5)
triangle3(0)
triangle3(1)
triangle3(9)
    
    