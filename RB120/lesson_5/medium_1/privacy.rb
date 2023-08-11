class Machine

  def how_to_get_switch
    self.switch
  end

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

switch = Machine.new
switch.start

puts switch.how_to_get_switch