class Animal
  def jump
    'jumping!'
  end

  def run
    'running!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

class Cat < Animal
  def speak
    "meow!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

karl = Bulldog.new
puts karl.speak
puts karl.swim

jake = Cat.new
puts jake.speak
puts jake.run

puts Cat.ancestors