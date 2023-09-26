def echo_with_yield(str)
  yield if block_given?
  str
end

echo_with_yield("Hello!") { puts "world" }

def say(words)
  yield if block_given?
  puts "> " + words
end

say("Hi there") do
  system "clear"
end

def increment(number)
  if block_given?
    yield(increment(number))
  end
  number + 1
end

increment(5) do |num|
  puts num
end

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare("hello") { |word| word.upcase}