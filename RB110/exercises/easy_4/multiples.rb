# Search for multiples of 3 OR 5 that lie between 1 and some other number, then 
# compute the sum of the multiples. 

# Questions: What if it is a multiple of 5 AND 3? (15) is it counted twice? - NO

# ex: 
# multisum(5) = (3 + 5)
# multisum(10) = 3 + 5 + 6 + 9 + 10

# Data structures : array

# Algorithm:
# GET the number of times 5 goes into the number
# Iterate through that and multiply by 5 to each index

# GET the number of times 3 goes into the number
# Iterate through that and multiply by 3 to each index

# DELETE the duplicates

# Sum total.

def multisum(num)
  fives = get_multiples(num, 5)
  threes = get_multiples(num, 3)
  
  combined = (fives + threes).uniq
  combined.inject(:+)
end

def get_multiples(num, multiple)
  array = []
  div = num / multiple
  div.times do |idx|
    number = (idx + 1) * multiple
    array << number
  end
  array
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
