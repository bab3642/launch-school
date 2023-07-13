def select_fruit(produce)
  selected_fruit = {}
  produce_keys = produce.keys
  counter = 0
  
  loop do
    current_key = produce_keys[counter]
    if produce[current_key] == "Fruit"
      selected_fruit[current_key] = produce[current_key]
    end
    counter += 1
    break if counter == produce_keys.size
  end
  # produce.each do |k, v|
  #   selected_fruit[k] = v if v == "Fruit"
  # end
  selected_fruit
end




produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
