age = rand(20..200) # (20..200).to_a.sample

def get_name
  name = gets.chomp
  return name unless name.strip.empty?
  return "Teddy"
end

  
puts "What is your name?"
user_name = get_name()

puts "#{user_name} is #{age} years old!"