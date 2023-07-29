# Switches labeled 1 thru n
# switches start in OFF position
# toggle each switch
# toggle every 2nd switch
# toggle every 3rd switch
# toggle every 4th switch
# n repetitions (nth) switch
# return an array with which switches are ON
require 'pry'

def toggle_switches(num)
  array = (0..num).map { 0 }
  num.times do |iteration|
    index = 0
    iteration += 1
    loop do
      array[index] = (array[index] == 0 ? 1 : 0)
      index += iteration
      break if index >= array.length
    end
  end
  places = []
  array.each_with_index do |switch, place|
    places << place if switch == 1
  end
  places.delete(0)
  places
end

p toggle_switches(5) # == [1, 4]
p toggle_switches(10) # == [1, 4, 9]
p toggle_switches(7)
p toggle_switches(1000)


# Create an array of zeroes 1..n
# iterate through n times, toggling every nth switch each time to a 1
# if the switch is a 1 already, it gets changed to a zero
# if the switch is a zero, it gets changes to a 1
# return the final array


# RETURN THE INDEXES FOR 1, MINUS THE FIRST THING

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000) == toggle_switches(1000)

def display_toggle_switches(num)
  array = (0..num).map { 0 }
  num.times do |iteration|
    index = 0
    iteration += 1
    loop do
      array[index] = (array[index] == 0 ? 1 : 0)
      index += iteration
      break if index >= array.length
    end
  end
  on = []
  off = []
  array.each_with_index do |switch, place|
    if switch == 1
      on << place 
    else
      off << place
    end
  end
  on.delete(0)
  off.delete(0)
  display_lights(on, off)
end

def display_lights(on, off)
  on_lights = on[0..-2].join(", ") + " and #{on.last}"
  puts "#{on_lights} are now on."
  off_lights = off[0..-2].join(", ") + " and #{off.last}"
  puts "#{off_lights} are now off."
end

display_toggle_switches(10)