# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new
# bob = Employee.new
# betty.print_address
# bob.print_address

# # Drivable
# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# # Houses
# class House
#   include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# # Home 1 is cheaper
# # Home 2 is more expensive

# Reverse Engineering

# class Transform
#   def initialize(data)
#     @data = data
#   end

#   def uppercase
#     @data.upcase
#   end

#   def self.lowercase(data)
#     data.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# # What will this do?
# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata # => 'ByeBye'
# puts thing.dupdata # => "HelloHello"

# # Comparing Wallets
# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     @amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# Pet shelter
# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#     Shelter.unadopted_pets(self)
#   end

#   def to_s
#     "a #{type} named #{name}"
#   end
# end

# class Owner
#   attr_reader :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets()
#     @pets.size
#   end

#   def add_pet(pet)
#     @pets << pet
#   end
# end

# class Shelter
#   @@owners = []

#   @@unadopted_pets = []


#   def self.unadopted_pets(pet = nil)
#     if pet
#       @@unadopted_pets << pet
#     else
#       @@unadopted_pets
#     end
#   end

#   def self.print_available_pets
#     puts "The Animal Shelter has the following unadopted pets:"
#     @@unadopted_pets.each { |pet| puts pet }
#   end

#   def initialize
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @@owners << owner
#     @@owners.uniq!
#     @@unadopted_pets.delete(pet)
#   end

#   def print_adoptions
#     @@owners.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.pets.each { |pet| puts pet }
#     end
#     puts "The shelter has the following unadopted pets:"
#     @@unadopted_pets.each { |pet| puts pet }
#   end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
# jake         = Pet.new('cat', "Jake")
# fart         = Pet.new('fart', "Fart")
# unadopted    = Pet.new('dog', "Bodie")

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
# bburton = Owner.new('B Burton')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.adopt(bburton, jake)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# puts "#{bburton.name} has #{bburton.number_of_pets} adopted pets."
# Shelter.print_available_pets
# puts "The Animal Shelter has #{Shelter.unadopted_pets.size} unadopted pets"

class Mammal
  def walk
    "#{self.name} #{self.gait} forward"
  end
end


class Person < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person

  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def gait
    "struts"
  end

  def walk
    "#{title} #{super}"
  end
end



mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
p byron.name
#=> "Byron"
p byron.title
#=> "Lord"