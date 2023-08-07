# # Persons

# class Person
#   def first_name= (value)
#   @first_name = value.capitalize
#   end

#   def last_name= (value)
#     @last_name = value.capitalize
#   end

#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person



# John Doe
# Jane Smith

# # Flight data
# class Flight

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end


# Car Mileage

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# # Rectangles and Squares
# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(side)
#     super(side, side)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# Cats!
# class Pet

#   attr_reader :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   attr_reader :color

#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{color} fur"
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# # My cat Pudding is 7 years old and has black and white fur.
# # My cat Butterscotch is 10 years old and has tan and white fur.


# Vehicles

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEEL_COUNT
  end
end


class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
  def wheels
    6
  end
end
