def print_in_box(message)
  message_lines = message_break(message)
  max_length = message_lines.max.length
  if max_length < 2
    max_length += 2 
    message_lines[0] = " " + message_lines[0] + " "
  end

  top_bottom_line = "+ "+("-" * max_length) + " +"
  banner_space = "| " + (" " * max_length) + " |"

  puts top_bottom_line
  puts banner_space
  message_lines.each do |line|
    puts "| " + line.ljust(max_length) + " |"
  end
  puts banner_space
  puts top_bottom_line
end 

def message_break(message)
  message_words = message.split
  message_lines = []
  single_line = []
  message_words.each do |word|
    if (single_line.join(' ') + word).length > 76
      message_lines.push(single_line.join(' '))
      single_line = []
      single_line.push(word)
    else
      single_line.push(word)
    end
  end
  if single_line.join(' ').length <= 76
    message_lines.push(single_line.join(' '))
  end
end



print_in_box("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of")
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('S')
print_in_box("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")