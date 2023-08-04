# Return an ARRAY of all CHARACTERS that show up in ALL STRINGS 
# within te given array (including duplicates!)
# For example if occurs three times in all strings but not 4, 
# Include it 3 times in the final array.

def common(array)
  counts = {}
  array.first.each_char do |char|
    count = []
    array.each do |word|
      count << word.count(char)
    end
    counts[char] = count
  end

  duplicates = counts.select { |k, v| v.all? { |num| num > 0 } }

  result = []
  duplicates.each do |ltr, count|
    count.min.times { result << ltr }
  end
  result.sort
end




p common(%w(bella label roller))  # == ['e', 'l', 'l']
p common(%w(hello goodbye booya random))