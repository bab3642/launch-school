require 'pry'

def print_in_box(text = "")
  if text.size > 76
    minuses = ""
    spaces = ""
    76.times do
      minuses << "-"
      spaces << " "
    end
    puts "+-#{minuses}-+"
    puts "| #{spaces} |"
    
    loop do
      chopped = text.slice!(0...76)
      break if chopped == ""
      if chopped.size < 75
        extra_spaces = ""
          (76 - chopped.size).times { extra_spaces << " " }
          puts "| " + chopped + extra_spaces + " |"
      else
        puts "| " + chopped + " |"
      end
    end
    
    puts "| #{spaces} |"
    puts "+-#{minuses}-+"
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
print_in_box("THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! THIS IS MORE THAN 80 CHARACTERS! ")
print_in_box("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")