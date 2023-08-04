# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# String argument. 
# RETURN CHARACTER that occurs LEAST OFTEN in the String
# IF MULTIPLE, RETURN THE ONE THAT APPEARS FIRST in the String
# When counting, disregard case

# Is Space considered a character? yes. Implicit.  

def least_common_char(string)
  downcase_string = string.downcase
  count = {}

  downcase_string.each_char do |char|
    next if count[char] 
    count[char] = downcase_string.count(char)
  end

  sorted_count = count.sort_by { |_, v| v }
  array = sorted_count.select { |_, v| v == sorted_count.first.last }
  letters = array.map { |subarr| subarr[0] }

  downcase_string.each_char do |letter|
    return letter if letters.include?(letter)
  end
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".

# Hash 

# Initialize a lowercase string 
# Iterate through it and log the count of each character. Using the count method. and log this to the Hash
# Sort the has by the lowest value
# Return that hash key