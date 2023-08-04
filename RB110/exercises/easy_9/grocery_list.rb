def buy_fruit(list)
  fruits = []
  list.each do |sublist|
    sublist[1].times { fruits << sublist[0] }
  end
  fruits
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])  ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]