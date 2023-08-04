def neutralize(sentence)
  words = sentence.split(' ')
  words.select! do |word|
    !negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Neutralize takes a sentence argument. we can see this on line 18 where we pass our
# sentence to the neutralize method.
# Inside the method, we split it into words array. 
# Iterate over the words array and we are MODIFYING (red flag) the array. It would be better to use SELECT here
# most likely. We will come back to it. We want all the negative? words removed.


# Let's change this to SELECT