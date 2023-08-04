# Arr of nums
# return the sum ofo the sums of each leading subsequence for that array

# a range and each method on the range, times on the time
def sum_of_sums(arr)
  sum = 0
  0.upto(arr.size - 1) do |num|
    sum += arr[0..num].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35