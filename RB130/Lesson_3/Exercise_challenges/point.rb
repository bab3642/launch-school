class DNA
  def initialize(string)
    @string = string
  end

  def hamming_distance(new_string)
    shortest_strand = (@string.length < new_string.length ? @string : new_string)
    other_strand = (shortest_strand == @string ? new_string : @string)
    count = 0
    shortest_strand.chars.each_with_index do |char, idx|
      count += 1 if char != other_strand[idx]
    end
    count
  end
end

# get both strings
# Iterate through them up until the shortest length
#