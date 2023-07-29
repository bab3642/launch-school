# take string, returns BOOLEAN true if all parentheses are properly balanced
# false if inbalanced
# must occur in ( ) pairs

# def balanced?(string, input1 = ')', input2 = '(')
#   arr1 = []
#   arr2 = []
#   string.each_char do |char|
#     arr1 << char if char == input1
#     return false if arr1.size > arr2.size
#     arr2 << char if char == input2
#   end
#   arr1.size == arr2.size
# end

def balanced?(string)
  parens = 0
  apos = 0
  quot = 0
  string.each_char do |char|
    parens -= 1 if %w(\) ] }).include?(char) 
    parens += 1 if %w(\( [ { ).include?(char)
    apos += 1 if char =~ /(?=> )+'/
    apos -= 1 if char =~ /'(?= )+/
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
p balances?("")


# There's 'nothing' '''wrong with'' this sentence ' ''' .
# Array

# iterate over each sentence. Shoot out the ( into an array
# shoot out the ) into a different array
# If at any time the ) array is bigger than the ( array, then return false
# If the arrays are the same size at the end return true 


