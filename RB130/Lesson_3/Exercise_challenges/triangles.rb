# Determine whether a triangle is E, I, or S

# E = all three sides equal
# I = TWO sides same
# S = all sides DIFFERENT

# To be a triangle, all sides must be of length > 0, and the SUM of ANY TWO
# sides must be GREATER than the length of the third side

class Triangle
  def initialize(s1, s2, s3)
    raise ArgumentError.new "Invalid triangle lengths" unless valid_sides?(s1, s2, s3)
    @sides = [s1, s2, s3]
  end

  def valid_sides?(s1, s2, s3)
    ([s1, s2, s3].all? { |num| num > 0 }) &&
    (s1 + s2 > s3) &&
    (s2 + s3 > s1) &&
    (s1 + s3 > s2)
  end

  def kind
    count = count_sides
    case count
    when 1
      'equilateral'
    when 2
      'isosceles'
    when 3
      'scalene'
    end
  end

  def count_sides
    @sides.uniq.size
  end
end


Triangle.new(0, 1, 2)