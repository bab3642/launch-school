# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end

# # BEN is right. The attr_reader adds a method that will run when balance is called
# # that returns @balance.

# # Q2
# class InvoiceEntry
#   attr_accessor :quantity, :product_name # change to accessor

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     self.quantity = updated_count if updated_count >= 0 # must add self BECAUSE
#     # if you don't, it thinks you are creating a local variable
#   end
# end


# # Q3
# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     self.quantity = updated_count if updated_count >= 0
#   end

#   private

#   attr_writer :quantity

# end

# The only thing that makes it wrong is that the setter method will be available outside of the
# class instance now. If we wanted to fix it we could do something like above.


# Q4
# class Greeting
#   def greet(string)
#     puts string
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("GoodBye")
#   end
# end

# # Q5
# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     string = ''
#     string << (@filling_type == nil ? "Plain" : @filling_type)
#     string << (@glazing == nil ? '' : " with #{@glazing}")
#     string
#   end

# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   #=> "Plain"

# puts donut2
# # => "Vanilla"

# puts donut3
# # => "Plain with sugar"

# puts donut4
# # => "Plain with chocolate sprinkles"

# puts donut5
# # => "Custard with icing"

# Q6
# There is no difference

# # Q7
# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def light_status
#     "I have a brightness level of #{brightness} and a color of #{color}"
#   end

# end

# # remove light....we already know that object is a light since it's in the Class!