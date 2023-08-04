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
    
# Upside down
def triangle_upside_down(n)
  n.times do |idx|
    puts "#{"*" * (n - (idx))}".rjust(n)
  end
end

def triangle_left_angle(n)
  n.times do |idx|
    puts "#{"*" * (n - (n - (idx + 1)))}"
  end
end

def triangle_top_left(n)
  n.times do |idx|
    puts "#{"*" * (n - (idx))}"
  end
end

  
# Right angle at any corner of grid
# 1 for bottom left, 2 for top left, 3 top right, 4 for bottom right (goes clock
# wise)
def  triangle_turner(n, corner = 4)
  case corner
  when 4
    triangle3(n)
  when 3
    triangle_upside_down(n)
  when 2
    triangle_top_left(n)
  when 1
    triangle_left_angle(n)
  end
end

triangle_turner(10, 1)
triangle_turner(5, 4)

# def triangle(number)
#   number.times do |num|
#     spaces = " " * (number - 1 - num)
#     stars = "*" * (num + 1)
#     puts "#{spaces}#{stars}"
#   end
# end


# def upside_down_triangle(number)
#   number.times do |num|
#     stars = "*" * (number - 1 - num)
#     spaces = " " * (num + 1)
#     puts "#{spaces}#{stars}"
#   end
# end

# def mirror_triangle(number)
#   number.times do |num|
#     stars = "*" * (num + 1)
#     puts "#{stars}"
#   end
# end

# def upside_down_mirror_triangle(number)
#   number.times do |num|
#     stars = "*" * (number - num)
#     puts "#{stars}"
#   end
# end



# def trapezoid(number)
#   number.times do |num|
#     spaces = " " * (number - 1 - num)
#     stars = "*" * (num + 1) + "*" * (num)
#     puts "#{spaces}#{stars}"
#   end
#   (number - 1).times do |num|
#     stars = "*" * ((number - 1 - num)  + (number - 2 - num))
#     spaces = " " * (num + 1)
#     puts "#{spaces}#{stars}"
#   end
# end

# trapezoid(9) 

# trapezoid(0)

# trapezoid(1)

# trapezoid(4)