TIME = Time.new

def calculate_years_left(age, retirement_age)
  retirement_age - age
end

def calculate_retirement_year(years_diff)
  years_diff + TIME.year
end

puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_left = calculate_years_left(current_age, retirement_age)
retirement_year = calculate_retirement_year(years_left)


puts "It's #{TIME.year}. You will retire in #{retirement_year}"
puts "You have only #{years_left} years of work to go!"