# Question 1

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# flintstones_hash = flintstones.to_h do |name|
#                     [name, flintstones.index(name)]
#                   end
# Question 2

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# added_ages = ages.values.sum
# p added_ages

#Question 3
 # ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.select! do |_, age|
#   age < 100
# end

# p ages

# ages.delete_if { |_, age| age >= 100 }

# p ages
# ages.keep_if { |_, age| age < 100 }

# Question 4
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# lowest_age = ages.values.sort[0]

# p lowest_age

# Question 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# name_index = nil
# flintstones.each_with_index do |name, index|
#   name_index = index if name[0, 2] == "Be"
# end

# p name_index
# flintstones.index { |name| name[0, 2] == "Be" }

# Question 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! do |name|
#   name[0, 3]
# end

# p flintstones

# Question 7
# statement = "The Flintstones Rock"

# letters = statement.chars.select do |char|
#   char.match?(/[a-zA-Z]/)
# end

# letters_count = {}

# letters.each do |letter|
#   letters_count[letter] = letters.count(letter)
# end

# p letters_count

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# outputs 1 3, returns [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# outputs 1 2, returns [1, 2]

# Question 9
# def titleize(title)
#   words = title.split
  
#   words.map! do |word|
#     word.capitalize
#   end
  
#   words.join(" ")
# end


# words = "the flintstones rock"

# p titleize(words)


# Question 10
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, info_hash|
#   info_hash["age_group"] = "adult" if (18..64).include?(info_hash["age"])
#   info_hash["age_group"] = "kid" if (0..17).include?(info_hash["age"])
#   info_hash["age_group"] = "senior" if info_hash["age"] >= 65
# end

# p munsters

# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end