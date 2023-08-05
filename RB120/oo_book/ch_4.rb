# class Animal
#   attr_accessor :name

#   def initialize
#   end

#   def speak
#     "hello!"
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super()
#     @color = color
#   end

#   def speak
#     super + " from GoodDog class"
#   end
# end

# class Cat < Animal
# end

# p sparky = GoodDog.new("pink")
# # paws = Cat.new
# # puts sparky.speak
# # puts paws.speak

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable  # mixing in Swimmable module
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable  # mixing in Swimmable module
# end


# sparky = Dog.new
# neemo  = Fish.new
# paws   = Cat.new

# p sparky.swim
# p neemo.swim
# p paws.swim


# module Walkable
#   def walk
#     "I'm walking"
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing"
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

# puts "---Animal method lookup---"
# puts Animal.ancestors


# fido = Animal.new
# p fido.speak
# p fido.walk

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end

# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')
# kitty.say_name('kitty')

# value = Mammal.some_out_of_place_method(4) # This is the PREFERRED way
# value = Mammal::some_out_of_place_method(4) # This is the LESS preferred way

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private # Makes the BELOW methods PRIVATE (Cannot be accessed outside this class def)

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure

# class Person
#   def initialize(age)
#     @age = age
#   end

#   def older?(other_person)
#     age > other_person.age
#   end

#   protected

#   attr_reader :age
# end

# malory = Person.new(64)
# sterling = Person.new(42)

# malory.older?(sterling)  # => true
# sterling.older?(malory)  # => false

# malory.age
#   # => NoMethodError: protected method `age' called for #<Person: @age=64>

class Vehicle

  @@number_of_vehicles = 0

  def self.num_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles in the garage."
  end

  def self.miles_per_gallon(gas, miles)
    mpg = miles / gas
    puts "Your car gets #{mpg} miles to the gallon"
  end

  def initialize(y, c, m)
    self.year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(num)
    @speed += num
    puts "You speed up #{num} mph in your #{year} #{@model}"
    display_speed
  end

  def slow_down
    @speed -= 1
  end

  def shut_off
    @speed = 0
  end

  attr_accessor :color, :model, :year

  def display_speed
    puts "You are going #{@speed} mph"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your new #{color} paint looks good!"
  end

  def display_age
    puts "Your vehicle is #{self.age} years old!"
  end

  private

  def age
    Time.new.year - self.year.to_i
  end
end

# module Typeable
#   def to_s
#     "Your is a #{year} #{color} #{model}."
#   end
# end

module Towable
  def has_hitch?
    true
  end

  def can_tow?(pounds)
    pounds < 2000
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
  VEHICLE_TYPE = "Truck"
  def to_s
    "My truck is a #{year} #{color} #{model}."
  end
end

class MyCar < Vehicle
  # include Typeable
  NUMBER_OF_DOORS = 4
  VEHICLE_TYPE = "Car"
  def to_s
    "Your car is a #{year} #{color} #{model}."
  end
end

my_car = MyCar.new("2019", "White", "Golf")
puts my_car

# my_car.speed_up(20)
# my_car.slow_down

# my_car.display_speed
# my_car.spray_paint("brown")

# MyCar.miles_per_gallon(20, 400)

my_truck = MyTruck.new("2020", "Blue", "Tundra")
puts my_truck

Vehicle.num_of_vehicles

p my_truck.has_hitch?


puts "---------Vehicle lookup----------"
puts Vehicle.ancestors

puts "---------MyCar lookup----------"
puts MyCar.ancestors

puts "---------MyTruck lookup----------"
puts MyTruck.ancestors

my_truck.display_age







# class Vehicle
#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4
# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2
# end

class Student

  attr_accessor :name

  def initialize(n, g)
    self.name = n
    self.grade = g
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  attr_accessor :grade

end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84.3)


puts "Well done!" if joe.better_grade_than?(bob)