=begin
Problem: 
return :right, :obtuse, :acute or :invalid
Right is when one angle is 90d
Acute is when all 3 angles are lss than 90d
Obtuse is when one angle is greater than 90d

SUM of angles must be 180
ALL angles must be bigger than 0

Data Structure: array

Algorithm:
Validate triangle
Figure out whether it is obtuse, right, or acute by looking through the values


Validate triangle: if 0, invalid, if sum != 180, invalid

otherwise valid

=end

def triangle(ang1, ang2, ang3)
  arr = [ang1, ang2, ang3].sort
  return :invalid unless valid_triangle?(arr)
  if arr[2] > 90
    :obtuse
  elsif arr.include?(90)
    :right
  elsif arr.all? { |angle| angle < 90 }
    :acute
  end
end


def valid_triangle?(arr)
  return false if arr.inject(:*) == 0 || arr.sum < 180
  true
end



p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid