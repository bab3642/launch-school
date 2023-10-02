# When you boot up a robot, then generate a random name

# Reset robot to factory settings, meaning the name gets wiped.

# Next tie asked it will respond with a new random name

# Do not allow the same name twice. TWO CAPITAL LETTERS AND THREE NUMBERS

class Robot
  attr_accessor :name
  @@names = []


  def initialize
    loop do
      @name = pick_name
      next if @@names.include?(@name)
      @@names << @name
      break
    end
  end

  def pick_name
    string = ''
    2.times { string << ('A'..'Z').to_a.sample }
    3.times { string << ('0'..'9').to_a.sample }
    string
  end

  def reset
    @@names.delete(@name)
    @name = pick_name
  end
end