VOWELS = %w(a e i o u)

def remove_vowels(string_arr)
  string_arr.map do |word|
    non_vowels = word.chars.select do |char|
      !VOWELS.include?(char.downcase)
      end
    non_vowels.join
  end
end




#takes an ARRAY of STRINGS and RETURNS an ARRAY of the same STRING value
# except with the vowels removed

# Iterate over array
# Iterate over each word
# remove vowels
# put words with removed values back into an array
# return 

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']