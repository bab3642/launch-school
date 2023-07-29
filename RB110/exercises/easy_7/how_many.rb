def count_occurrences(vehicles)
  count = {}
  down = vehicles.map(&:downcase)
  down.each { |type| count[type] = down.count(type) }
  count
end



vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2