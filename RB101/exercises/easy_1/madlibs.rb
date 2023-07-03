def get_noun
  puts "Enter a noun:"
  gets().chomp()
end

def get_verb
  puts "Enter a verb:"
  gets().chomp()
end

def get_adj
  puts "Enter an adjective:"
  gets().chomp()
end

def get_adverb
  puts "Enter an adverb:"
  gets().chomp()
end

noun = get_noun()
verb = get_verb()
adj = get_adj()
adv = get_adverb()

puts "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"