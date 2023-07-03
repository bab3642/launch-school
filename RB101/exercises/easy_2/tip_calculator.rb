def calculate_tip(number, percent)
  percent / 100 * number
end


  
puts("What is the bill?")
bill = gets.chomp.to_f

puts("What is the tip percentage?")
tip_pct = gets.chomp.to_f

tip = calculate_tip(bill, tip_pct)

total = bill + tip

 
puts "The tip is $" + sprintf("%.2f", tip)
puts "The total is $#{sprintf("%.2f", total)}"



