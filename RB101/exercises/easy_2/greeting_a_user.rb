def reply_name(name)
  if name =~ /\b.*!\z/
    puts "HELLO #{name.upcase.chomp("!")}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}." 
  end
end

  

puts "What is your name?"
name = gets.chomp

reply_name(name)

