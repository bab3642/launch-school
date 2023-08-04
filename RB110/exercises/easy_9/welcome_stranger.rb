def greetings(arr, hash)
  name = arr.join(" ")
  title_occ = hash[:title] + hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{title_occ} around. "
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."