# use select or reject to return a NEW array identical in structure to the original but containing only 
# integers that are multiples of 3

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]


new_array = arr.map do |subarray|
            subarray.select do |num|
              num % 3 == 0
            end
          end

p new_array