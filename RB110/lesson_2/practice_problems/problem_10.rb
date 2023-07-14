array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

modified_array =  array.map do |hash|
                    hash.map { |key, value| {key => (value += 1)} }
                  end
modified_array = modified_array.flatten
                  
p modified_array

