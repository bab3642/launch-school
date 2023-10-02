class Diamond
  NUMBERS = (1..51).step(2).to_a

  LETTERS = ('A'..'Z').to_a.each_with_object({}).with_index do |(ltr, hsh), idx|
    hsh[NUMBERS[idx]] = ltr
  end

  def self.print_row(grid_size, distance_from_center, count, string)
    number_of_stars = grid_size - 2 * distance_from_center
    stars = LETTERS[count] * number_of_stars
    if number_of_stars == 1
     string << stars.center(grid_size) + "\n"
    else
     string << " " * distance_from_center + LETTERS[count] +
     " " * (number_of_stars - 2) + LETTERS[count] + " " * distance_from_center +
     "\n"
    end
  end

  def self.make_diamond(ltr)
    grid_size = LETTERS.key(ltr)
    max_distance = (grid_size - 1) / 2
    count = 1
    string = ''
    max_distance.downto(0) do |distance|
      print_row(grid_size, distance, count, string)
      count += 2
    end
    count -= 4
    1.upto(max_distance) do |distance|
      print_row(grid_size, distance, count, string)
      count -= 2
    end
    string
  end
end
