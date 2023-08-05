# class Cat
#   def self.generic_greeting # In the solution, self refers to the Cat class.
#     puts "Hello! I am a cat!"
#   end
# end


# kitty = Cat.new
# Cat.generic_greeting
# kitty.class.generic_greeting

# Problem 2

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(name)
#     self.name = name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

# class Cat
#   attr_accessor :name

#   def identify
#     self
#   end

#   def initialize(name)
#     @name = name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify

# class Cat
#   attr_accessor :name

#   def self.generic_greeting
#     puts "Meow, I am a cat!"
#   end

#   def initialize(name)
#     @name = name
#   end

#   def personal_greeting
#     puts "I am a cat and my name is #{self.name}"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.name = "Bob"
# kitty.personal_greeting


# class Cat
#   @@number_of_cats = 0

#   def initialize
#     @@number_of_cats += 1
#     puts "meow!"
#   end

#   def self.total
#     puts @@number_of_cats
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

# class Cat
#   COLOR = "yellow"

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "I am a #{COLOR} cat named #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

class Person
  attr_writer :secret

  def compare_secret(person2)
    self.secret == person2.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
