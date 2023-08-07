class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name) # Initializes @name as '42'
name += 1 # reassignes local variable name to 43
puts fluffy.name # Reads the initialized @name ('42')
puts fluffy # Calls the to_s method in the class
puts fluffy.name # Same as line 16
puts name # calls the LOCAL variable 43.to_s = '43'