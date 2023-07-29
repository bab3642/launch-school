# 8 pointed star in an n x n grid
# n is ODD
require 'pry'

def star(num)
 string = " " * num
 first_stars = (1..(num / 2)).to_a
 middle_star = num / 2
 end_stars = (num).downto((num / 2) + 2).to_a
 (num / 2).times do |idx|
   string[first_stars[idx] - 1] = "*"
   string[middle_star] = "*"
   string[end_stars[idx] - 1] = "*"
   puts string
   string = " " * num
 end
 puts "*" * num
 first_stars.reverse!
 end_stars.reverse!
 (num / 2).times do |idx|
   string[first_stars[idx] - 1] = "*"
   string[middle_star] = "*"
   string[end_stars[idx] - 1] = "*"
   puts string
   string = " " * num
 end
end

  # 1 4 7
  # 2 4 6
  # 3 4 5
  # 1234567
  # 3 4 5 
  # 2 4 6
  # 1 4 7

star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
# * * *
# *  *  *

star(9)

# *   *   *
# *  *  *
#   * * *
#   ***
# *********
#   ***
#   * * *
# *  *  *
# *   *   *

star(51)

# data structure - array
# Algo - one star will go in the middle ALWAYS - 4 lines on top
# 4 lines on bottom for 9 - one row in the middle that has a whole row of stars
# space in between them decreases by one