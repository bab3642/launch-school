class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h , w)
    @name = n
    @height = h
    @weight = w
  end
  
  def speak
    "#{name} says 'arf!'"
  end
  
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  
  def info
    "#{name} weighs #{weight} and is #{height} tall"
  end
end

sparky = GoodDog.new("Sparky", '12 inches', '10 lbs')
puts sparky.info

sparky.change_info("Spartacus", '24 inches', '45 lbs')
puts sparky.info


class MyCar
  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end
  
  attr_accessor :color
  attr_reader :year
  
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
  
  def display_speed
    puts "You are going #{@speed} mph"
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Your new #{color} paint looks good!"
  end
  
end

my_car = MyCar.new("2019", "White", "Golf")


my_car.speed_up(20)
my_car.slow_down

my_car.display_speed

puts my_car.year
my_car.spray_paint("brown")

puts my_car.color
