def is_odd?(int)
  return true if int % 2 != 0
  
  false
end
def is_odd2?(int)
  int.remainder(2) != 0
end
p is_odd2?(0)
p is_odd2?(-2)
p is_odd2?(9)
p is_odd2?(-13)
=begin

def is_odd?(number)
  number % 2 == 1
end

=end
