# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# A proc has lenient Arity, meaning it can be called with more or less arguments
# than parameters. If we don't pass in an argument, the parameter will be nil.
# Procs are also a class in Ruby, whereas Lambdas are NOT
# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Lambdas have strict arity - they must be called with the exact number of arguments as
# parameters. They also are not a class - cannot be instantiated with Lambda.new. They are part of the Proc
# class. So, a Lambda is a type of Proc. Lambda can also be created with the
# shortcut ->(thing){} where thing is the parameter

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')
# We cannot have a method that yields if there is no block given
# We need to yield(animal) if we want the intended effect


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# blocks have lenient arity. Seal is assigned to nil.
# The last line, animal variable comes from nowhere. The block cannot look into
# the method parameters. They do not share these.


# Procs are similar to blocks, that can be passed around. Procs and blocks can be
# called with .call
# Lambdas are more strict than procs and need the exact number of arguments to be passed.
# Lambdas are a special type of Proc.
# Blocks are neither a proc or lambda, but cannot be passed unless they are converted to a
# proc.  They share Proc lenient arity.A block is a closure, it is not an object.
#CLOSURE ________!!!!!!!!!!