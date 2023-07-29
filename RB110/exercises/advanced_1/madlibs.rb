# read text in a file I created then plugs it in
require 'pry'
require 'pry-byebug'

text = File.read('madlibs.txt')

user_input = Hash.new()

def get_input(wordtype, num, hash)
  hash[wordtype] = []
  num.times do 
    puts "Enter a unique #{wordtype}:"
    input = gets.chomp
    hash[wordtype] << input
  end
end

def select_hash_val!(hash, wordtype)
  # key = hash.keys.select {|key| word.include?(key) }
  new_word = hash[wordtype].sample
  delete_hash_val!(hash[wordtype], new_word)
  new_word
end

def delete_hash_val!(arr, word)
  arr.delete(word)
end

get_input('adjective', 2, user_input)
get_input('verb', 2, user_input)
get_input('noun', 3, user_input)
get_input('adverb', 2, user_input)

words = text.split


# 2.times do |idx|
#   text.sub!('%{adjective}', "#{user_input['adjective'][idx]}")
# end
# p text

words.map! do |word|
  if word.match?(/%{[a-z]+}/)
    ending = ''
    if word[-1] != '}'
      ending = word[-1]
    end
    select_hash_val!(user_input, word.slice(/(?<=%{)[a-z]+(?=})/)) + ending
    # user_input.keys.select { |key| word == "%{#{key}}" }.empty?
    # binding.pry
  else
    word
  end
end

p words.join(" ")

# Hash, array
# I need to REPLACE the word with the hash item. Delete it from the hash when it
# is done. Sample from the hash. 

# If the string matches #{***} then put a slice of the *** section into the Hash. 
# Return a random value form the hash array
# delete the value returned
# Continue


# JUST INTERPOLATE THE DAMN THING! or use gsub in order