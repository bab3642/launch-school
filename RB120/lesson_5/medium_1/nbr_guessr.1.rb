class Player

  attr_reader :guesses, :guess, :hi_num, :lo_num

  def initialize(num1, num2)
    @guesses = (Math.log2(num2-num1).to_i + 1)
    @guess = nil
    @hi_num = num2
    @lo_num = num1
  end



  def choose_guess
    input = nil
    loop do
      puts "Enter a number between #{lo_num} and #{hi_num}:"
      input = gets.chomp.to_i
      break unless invalid_guess?(input)
      puts "Invalid guess."
    end
    self.guesses -= 1
    self.guess = input
  end

  private

  attr_writer :guesses, :guess

  def invalid_guess?(num)
    num < lo_num || num > hi_num
  end

end


class GuessingGame

  def initialize(num1, num2)
    @number = rand(num1..num2)
    @player = Player.new(num1, num2)
    @answer_correct = false
  end

 def play
   loop do
     display_remaining_guesses
     player.choose_guess

     display_result
     break if player.guesses == 0 || answer_correct
   end
   display_end_msg
 end

  private

  attr_accessor :answer_correct
  attr_reader :number, :player

  def display_remaining_guesses
    puts "You have #{player.guesses} guesses remaining."
  end

  def display_result
    if player.guess > number
      puts "Your guess is too high"
    elsif player.guess < number
      puts "Your number is too low"
    else
      self.answer_correct = true
    end
  end

  def display_end_msg
    if answer_correct
      puts "That's the number!"
      puts ''
      puts "You won!"
    else
      puts "You have no more guesses. You lose!"
    end
  end
end




game = GuessingGame.new(1, 15)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!