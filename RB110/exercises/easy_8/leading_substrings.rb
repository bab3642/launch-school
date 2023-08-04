def leading_substrings(string)
  arr = []
  0.upto(string.length - 1) do |num|
    arr << string[0..num]
  end
  arr
end


# RETURNS a LIST (array) of all substrings of a string that start the beginning of the original string.
# SORT the list from shortest to longeest

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# ALL substrings

def substrings(string)
  arr = []
  0.upto(string.length - 1) do |index|
    arr << leading_substrings(string[index..-1])
  end
  arr.flatten
end

p substrings('abcde')  == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

def palindromes(string)
  substrings(string).each_with_object([]) do |word, arr|
    arr << word if palindrome?(word)
  end
end

def palindrome?(word)
  no_nums = word.delete("^a-zA-Z0-9")
  no_nums.size > 1 && no_nums.downcase == no_nums.reverse.downcase
end

p palindromes('abcd')  == []
p palindromes('Mad-am')  # == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') # == [
  # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  # '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
# ALL substrings that are palindromic
# Return value should be arranged in the same sequence they appear
# INCLUDE duplicate palindromes