# take a meetup year and month
# receive the day NAME and TIME (first, second, etc)
# Determine the exact date


# I will need to use the Date class
# Maybe an array or hash

class Meetup
  DESCRIPTORS = {
    first: 1,
    second: 2,
    third: 3,
    fourth: 4,
    fifth: 5,
  }

  def initialize(year, month)
    @year = year
    @month = month
    @start_day = Date.civil(@year, @month, 1)
  end

  def day(day, descriptor)
    if descriptor.downcase == 'teenth'
      teenth(day, descriptor)
    elsif descriptor.downcase == 'last'
      last(day, descriptor)
    else
      count = 0
      loop do
        case day.downcase
        when 'monday'
          count += 1 if @start_day.monday?
        when 'tuesday'
          count += 1 if @start_day.tuesday?
        when 'wednesday'
          count += 1 if @start_day.wednesday?
        when 'thursday'
          count += 1 if @start_day.thursday?
        when 'friday'
          count += 1 if @start_day.friday?
        when 'saturday'
          count += 1 if @start_day.saturday?
        when 'sunday'
          count += 1 if @start_day.sunday?
        end
        break if DESCRIPTORS[descriptor.downcase.to_sym] == count
        @start_day = @start_day.next
        return nil if @start_day.month != @month
      end
      @start_day
    end
  end

  protected

  attr_accessor :start_day

  def teenth(day, descriptor)
    meetup = self.class.new(@year, @month)
    meetup.start_day = Date.civil(@year, @month, 13)
    meetup.day(day, 'first')
  end

  def last(day, descriptor)
    self.class.new(@year, @month + 1).day(day, 'first').prev_day(7)
  end

end

# I will need to iterate through the days of the month given and COUNT the number of times
# the given day is hit
# if the string, converted to a symbol and fed into a hash key, value matches the count
# then that is the day that we need
# I need to program 'last' separately, since it could be 3, 4, or 5. I need to look at the
# documentation to see how to deal with this one but I would bet there is a method.
# To get the last day I can start from the END of the month and work backwards.
# I need to return a DATE OBJECT

