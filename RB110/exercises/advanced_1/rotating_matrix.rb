def rotate(matrix, angle = 90)
   case angle
   when 90 then rotate90(matrix)
   when 180 then rotate90(rotate90(matrix))
   when 270 then rotate90(rotate90(rotate90(matrix)))
   when 360 then matrix
   end
end
def rotate90(matrix)
  new_matrix = []
  matrix[0].size.times do |num|
    new_matrix << []
    (matrix.size - 1).downto(0) { |index| new_matrix[num] << matrix[index][num] }
    # matrix.each { |subarr| new_matrix[num] << subarr[num] }
  end
  new_matrix
end

# want to be able to take an arbitrary size matrix
# rotate it 90 degrees
# 

# 3  4  1
# 9  7  5
# 6  2  8

# 3  4  1
# 9  7  5

# 9  3
# 7  4
# 5  1

def transpose(matrix)
 
end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

p rotate([[3, 4, 1], [9, 7, 5]], 360)

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2