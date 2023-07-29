# return the number of friday the 13ths in a given year


# Iterate through each day and if it is a friday check if it's the 13th. If it is increase the counter
require 'date'

def friday_13th(year)
  # Date.new(year).step(Date.new(year, -1, -1)).select { |d| d.friday? && d.day == 13  }.size
  
  months = Date.new(year).step(Date.new(year, -1)).select { |d| d.month  }.size
  
  
end

p friday_13th(2015) # == 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2

def five_fridays(year)
  fridays_count = 0
  months_count = Hash.new(0)
  date = Date.civil(year)
  if !date.leap?
    365.times do
    current_month = date.month
    fridays_count += 1 if date.friday?
    months_count[current_month] = true if fridays_count == 5
    date = date.next_day
    fridays_count = 0 if current_month != date.month
    end
  else
    366.times do 
    current_month = date.month
    fridays_count += 1 if date.friday?
    months_count[current_month] += 1 if fridays_count == 5
    date = date.next_day
    fridays_count = 0 if current_month != date.month
    end
  end
    
  months_count
end

p five_fridays(2015)

require 'date'

