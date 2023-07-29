# def diamond(num)
#   1.upto(num) { |number| puts ("*" * number).center(num) if number.odd? }
#   (num - 1).downto(1)  { |number| puts ("*" * number).center(num) if number.odd? }
# end
require 'pry'

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  if number_of_stars == 1
   puts stars.center(grid_size)
  else
   puts " " * distance_from_center + "*" + " " * (number_of_stars - 2) + "*"
  end
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

# 4-pointed diamond in an n x n grid
# integer will ALWAYS be odd

 diamond(1)

# *

 diamond(3)

# *
# **
# *
 
 diamond(9)

#     *
#   ***
#   *****
# *******
# **
# *******
#   *****
#   ***
#     *