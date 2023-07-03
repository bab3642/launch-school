def get_length
  gets.chomp()
end

def get_width
  gets.chomp()
end

def calculate_area(width, length)
  (width.to_f * length.to_f).round(2)
end

def convert_to_ft(meters)
  (meters * 10.7639).round(2)
end

puts "Please enter the length of the room in meters:"
length = get_length()

puts "Please enter the width of the room in meters:"
width = get_width()

area = calculate_area(width, length)
area_in_ft = convert_to_ft(area)

puts "The area of the room is #{area} square meters (#{area_in_ft} square feet)"

