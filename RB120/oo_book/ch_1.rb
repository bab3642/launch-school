# An object is created in ruby by calling the (Kernel)? method .new on a class. For 
# Example: 


# A module is a collection of methods/behaviors that can be mixin'd to our class
# by using the include method invocation

module Look
  def look(object)
    puts object.object_id
  end
end

class MyClass
  include Look
end

my_obj = MyClass.new

my_obj.look(":") # => 60
