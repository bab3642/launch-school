hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)

hsh.each_value do |array|
  array.each do |word|
    word.each_char do |character|
      puts character if VOWELS.include?(character)
    end
  end
end

  
  