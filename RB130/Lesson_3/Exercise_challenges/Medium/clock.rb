class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour = 0, minute = 0)
    Clock.new(hour, minute)
  end

  def +(minute)
    hour, minutes =  (@minute + minute).divmod(60).map(&:abs)
    hours = (@hour + hour) % 24
    Clock.new(hours, minutes)
  end

  def -(minute)
    hour, minutes = (@minute - minute).divmod(60).map(&:abs)
    hours = (@hour - hour) % 24
    Clock.new(hours, minutes)
  end

  def to_s
   format('%02d:%02d', @hour, @minute);
  end

  def ==(other)
    self.to_s == other.to_s
  end
end