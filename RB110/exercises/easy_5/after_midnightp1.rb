require 'pry'

def time_of_day(num)
  minutes_to_increment = num % 1440
  hours, minutes = minutes_to_increment.divmod(60)
  sprintf("%02d:%02d", hours, minutes)
end

def after_midnight(time)
  hours = time[0, 2].to_i
  mins = time[3, 2].to_i
  if hours == 24
    0
  else
  hours * 60 + mins
  end
end

def before_midnight(time)
  hours = 23 - time[0, 2].to_i
  mins = 60 - time[3, 2].to_i
  if mins == 60
    mins = 0
  end
  if hours == 23 || hours == -1
    hours = 0
  end
  hours * 60 + mins
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0


# p time_of_day(0)  == "00:00"
# p time_of_day(-3)  == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437)  == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# def time_of_day_using_timeclass(minutes)
#   time = Time.new(0) + minutes * 60
#   time.strftime("%R")
# end


#midnight is 00:00
#Return a STRING
# 60 minutes in an hour

# max of 24:00

#data structure = hash? 
# algo:
# if the time absolute value is more than 60, we need to increment hours
# IF the time value is more than 1440 (num of minutes in a day) then we need to start over 
#   So, we can call modulo 1440 on the number. AND modulo always returns a POSITIVE value if 
  # the second value is positive
  # divmod on num