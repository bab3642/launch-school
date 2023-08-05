class Person
  attr_accessor :last_name, :first_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    [@first_name, @last_name].join(" ").strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    full_name = full_name.split
    self.first_name = full_name[0]
    self.last_name = (full_name.size > 1 ? full_name[1] : '')
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"