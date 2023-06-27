# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub!("important", "urgent")

# Question 5
x = 42
(10..100).each do |idx|  # (10..100).cover?(42)
  puts "Have a match!" if idx == 42
end

# Question 6
famous_words = "seven years ago..."

puts "Four score and #{famous_words}"
puts "Four score and " + famous_words
puts famous_words.prepend("Four score and ")

#Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten()
  
#Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, 
"BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")