def calculate_bonus(salary, boolean)
  unless boolean
    0
  else
    salary / 2
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

#def calculate_bonus(salary, bonus)
#  bonus ? (salary / 2) : 0
#end