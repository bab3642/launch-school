#Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.keys.include?("Spot")
p ages["Spot"] == true
p ages.select { |key, value| key == 'Spot' }.shift != nil
p ages.value?("Spot")
p ages.has_value?("Spot")
 # ages.key?("Spot"), ages.include?("Spot"), ages.member?("Spot")
 
 # Question 2
 munsters_description = "The Munsters are creepy in a good way."
 
 p munsters_description.swapcase!
 p munsters_description.capitalize!
 p munsters_description.downcase!
 p munsters_description.upcase!
 
 # Question 3
 ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
 additional_ages = { "Marilyn" => 22, "Spot" => 237 }
 
 p ages.merge!(additional_ages)
 
 # Question 4
 advice = "Few things in life are as important as house training your pet dinosaur."
 
 p advice.include?("Dino")
 
 # Question 5
 flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
 flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
 
 # Question 6
 flintstones << "Dino"
 
 # Question 7
 flintstones.concat(["Dino", "Hoppy"]) #flintstones.concat(%w(Dino Hoppy))
 
 # Question 8
 advice = "Few things in life are as important as house training your pet dinosaur."
 
 p advice.slice!("Few things in life are as important as ")
 # advice.slice!(0, advice.index('house'))
 p advice
 # If using .slice, it would return self (original advice string)
 
 # Question 9
 statement = "The Flintstones Rock!"
 p statement.count("t")
 
 #Question 10
 title = "Flintstone Family Members"
 20.times { title.prepend(" ") }
 p title
 
 p title.center(40)