
def real_palindrome?(string)
  string = string.downcase
  string = string.delete('^a-zA-Z0-9')
  palindrome?(string)
end

def palindrome?(array_or_string)
  array_or_string == array_or_string.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
