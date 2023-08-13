class Player
  NUM_GUESSES = 7
  attr_reader :guesses, :guess

  def initialize
    @guesses = NUM_GUESSES
    @guess = nil
  end



  def choose_guess
    input = nil
    loop do
      puts "Enter a number between 1 and 100:"
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
    num < 1 || num > 100
  end

end


class GuessingGame

  def initialize
    @number = rand(1..100)
    @player = Player.new
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




game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!