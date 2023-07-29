# def dms(floatnum)
#   # if floatnum == 0
#   #   minutes, seconds = [0, 0]
#   # elsif floatnum.to_i == 0
#   #   minutes = floatnum * 60
#   #   seconds = get_seconds(minutes)
#   # else
#   #   degrees = floatnum.to_i
#   #   minutes = get_minutes(floatnum)
#   #   seconds = get_seconds(minutes)
#   # end
  
#   time = Time.new(0)
#   if floatnum == 0
#     time
#   elsif floatnum.to_i == 0
#     seconds = floatnum * 60 * 60
#   else
#     remainder = floatnum % floatnum.to_i
#     seconds = remainder * 60 * 60
#   end
    
#   time = get_time(time, seconds)
  
#   puts "%(#{floatnum.to_i}°#{sprintf("%02d", time.min)}'#{sprintf("%02d", time.sec)}" + '")'
  
# end

# def get_time(time, seconds = 0)
#   Time.at(time + seconds)
# end

# def get_minutes(degrees)
#   remainder = degrees % degrees.to_i
#   remainder * 60
# end

# def get_seconds(minutes)
#   if minutes == 0
#     return 0
#   end
#   remainder = minutes % minutes.to_i
#   remainder * 60
# end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# # takes a number that represents an angle. returns string that represents degree, minute
# # seconds. 1 degree has 60 minutes while a minute has 60 seconds. 


DEGREE = "\xC2\xB0"
SECONDS_PER_MIN = 60
SECONDS_PER_DEGREE = SECONDS_PER_MIN * 60

def dms(floatnum)
  total_seconds = (floatnum * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MIN)
  
  format(%())
end


p dms(30) #== %(30°00'00")
p dms(76.73)# == %(76°43'48")
p dms(254.6)# == %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")