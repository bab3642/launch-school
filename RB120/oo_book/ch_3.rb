# class GoodDog
#   DOG_YEARS = 7
#   @@number_of_dogs = 0

#   attr_accessor :name, :height, :weight

#   def initialize(n, w, h)
#     @@number_of_dogs += 1
#     self.name = n
#     self.weight = w
#     self.height = h
#   end

#   def change_info(n, w, h)
#     self.name = n
#     self.weight = w
#     self.height = h
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end

#   def what_is_self
#     self
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   puts self

# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new("Sparky", 42, 44)


# puts GoodDog.total_number_of_dogs

# p "#{dog1}"

# p dog1.what_is_self


class MyCar

  def self.miles_per_gallon(gas, miles)
    mpg = miles / gas
    puts "Your car gets #{mpg} miles to the gallon"
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end


  attr_accessor :color, :model, :year

  def speed_up(num)
    @speed += num
    puts "You speed up #{num} mph in your #{year} #{@model}"
    display_speed
  end

  def to_s
    "Your car is a #{year} #{color} #{model}."
  end


  def slow_down
    @speed -= 1
  end

  def shut_off
    @speed = 0
  end

  def display_speed
    puts "You are going #{@speed} mph"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your new #{color} paint looks good!"
  end

end

my_car = MyCar.new("2019", "White", "Golf")
puts my_car

my_car.speed_up(20)
my_car.slow_down

my_car.display_speed
my_car.spray_paint("brown")

MyCar.miles_per_gallon(20, 400)


class Person
  attr_accessor :name
  # attr_writer :name ## => This also works but doesn't allow getter access
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
