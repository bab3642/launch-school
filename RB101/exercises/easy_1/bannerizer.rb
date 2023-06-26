def print_in_box(text = "")
  if text.size > 80
    loop do
      text.split()
  else
    minuses = ""
    spaces = ""
    text.size.times do
      minuses << "-"
      spaces << " "
    end
  
    puts "+-#{minuses}-+"
    puts "| #{spaces} |"
    puts "| " + text + " |"
    puts "| #{spaces} |"
    puts "+-#{minuses}-+"
  end
end

print_in_box('To boldly go where no one has gone before.')
print_in_box()
print_in_box("I am having fun!")
print_in_box("There is probably a better way to do this!")