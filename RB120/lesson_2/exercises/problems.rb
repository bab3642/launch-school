# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# Problem 2

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat # RESERVED word class
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "I am a cat and my name is #{self.name.capitalize}!"
  end

end # RESERVED word end

# Problem 3

kitty = Cat.new('jake') # To instantiate a new Cat object, we use the class method ::new
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk
