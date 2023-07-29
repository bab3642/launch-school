def word_sizes(string)
  modified_words = ''
  string.each_char do |char|
    if char.match?(/[a-z ]/i)
      modified_words << char
    end
  end
  words = modified_words.split
  lengths = words.map do |word|
    word.length
  end
  length_count_hash = {}
  
  lengths.each do |num|
    if length_count_hash[num]
      length_count_hash[num] += 1
    else
      length_count_hash[num] = 1
    end
  end
  length_count_hash.sort_by { |k, v| k }.to_h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
