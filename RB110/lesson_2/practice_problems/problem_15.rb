arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

mapped_arr = arr.select do |hash|
               hash.values.flatten.all? { |num| num.even? }
             end

p mapped_arr