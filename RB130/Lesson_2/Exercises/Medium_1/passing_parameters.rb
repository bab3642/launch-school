# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) do |produce|
#   puts produce.join(', ')
# end


# Question 2

# def method(array)
#   yield(array)
# end

# method(%w(raven finch hawk eagle)) do |raven, finch, *raptors|
#   raven = raven
#   finch = finch
#   raptors = raptors
# end

# Question 3

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, wheat|
  puts  produce.join(", ")
  puts  wheat
end

gather(items) do |apples, *produce, wheat|
  puts apples
  puts produce.join(", ")
  puts wheat
end

gather(items) do | apples, *produce|
  puts apples
  puts produce.join(", ")
end

gather(items) do |a, c, cab, w|
  puts "#{a}, #{c}, #{cab}, and #{w}"
end