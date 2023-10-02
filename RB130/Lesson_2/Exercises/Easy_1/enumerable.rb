# class Tree
#   include Enumerable

#   def each

#   end

#   def <=>

#   end
# end

# # Optional Blocks
# def compute(arg)
#   if block_given?
#     yield(arg)
#   else
#     'Does not compute.'
#   end
# end

# p compute("purple") == "Does not compute."
# p compute(5) { |num| num + 2 } == 7
# p compute("string") { |str| str + " was computed" } == "string was computed"

# Find missing numbers
# def missing(array)
#   result = []

#   # array[0].upto(array[-1]) do |num|
#   #   result << num unless array.include?(num)
#   # end

#   num = array[0]
#   loop do
#     break if num == array[-1]
#     result << num unless array.include?(num)
#     num += 1
#   end

#   result
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []


# take the first number and the last number of the array
# If the array is one number long then return an empty array
# num upto num, if the number is included in the original array, then next iteration
# Otherwise, add it to a results array
# return the results array

# Divisors

# require 'benchmark'

# def divisors(num)
#   results = []

#   1.upto(num)do |count|
#     break if results.include?(count)
#     if num % count == 0
#       results << count
#       results << num / count
#     end
#   end

#   results.uniq.sort
# end

# # p divisors(1)  == [1]
# # p divisors(7) == [1, 7]
# # p divisors(12) == [1, 2, 3, 4, 6, 12]
# # p divisors(98) == [1, 2, 7, 14, 49, 98]
# puts Benchmark.measure { divisors(99400891) } # == [1, 9967, 9973, 99400891] # may take a minute

# # Iterate through the number - divide it by the thing IF the modulo is zero
# # Then include the number divided by that number in the array also.
# # If the array INCLUDES the number already then break

# Encrypted Pioneers

# INPUT = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".chars
# OUTPUT = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm".chars

# CYPHER = INPUT.each_with_object({}).with_index do |(ltr, hsh), idx|
#   hsh[ltr] = OUTPUT[idx]
#   end

# def decode(name)
#   name.chars.map { |ltr| ltr == ' ' ? ' ': CYPHER[ltr] }.join
# end

# p decode('Nqn Ybirynpr')
# # Nqn Ybirynpr
# # Tenpr Ubccre
# # Nqryr Tbyqfgvar
# # Nyna Ghevat
# # Puneyrf Onoontr
# # Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# # Wbua Ngnanfbss
# # Ybvf Unvog
# # Pynhqr Funaaba
# # Fgrir Wbof
# # Ovyy Tngrf
# # Gvz Orearef-Yrr
# # Fgrir Jbmavnx
# # Xbaenq Mhfr
# # Fve Nagbal Ubner
# # Zneiva Zvafxl
# # Lhxvuveb Zngfhzbgb
# # Unllvz Fybavzfxv
# # Tregehqr Oynapu