name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# prints out BOB BOB. name and save name both point to the same object, our original 
# "bob" string. When we call name.upcase! on it, this is a mutating method (hence the !, which is 
# usually but not always present). This mutates the original string of "Bob" to "BOB"
# We have not created a new object, simply mutated the original one which both name and 
# save_name are pointing to.