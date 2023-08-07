# frozen_string_literal: true

class Move
  VALUES = %w(r p sc l sp rock spock lizard paper scissors).freeze
  MOVES = {
    'r'  => %w(sc l),
    'p'  => %w(r sp),
    'sc' => %w(p l),
    'sp' => %w(sc r),
    'l'  => %w(sp p)
    }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other)
    MOVES[value].include?(other.value)
  end

  def <(other)
    MOVES[other.value].include?(value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def parse_choice(choice)
    if %w(sc sp scissors spock).include?(choice)
      choice[0..1]
    else
      choice[0]
    end
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      system('clear')
      puts 'Sorry, must enter a value'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose (r)ock, (p)aper, (sc)issors, (l)izard, or (sp)ock:'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      system('clear')
      puts 'Sorry, invalid choice.'
    end
    choice = parse_choice(choice)
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    choice = Move::VALUES.sample
    choice = parse_choice(choice)
    self.move = Move.new(choice)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    system('clear')
  end

  def display_welcome_message
    puts <<-MSG
=>Welcome to Rock Paper Scissors Lizard Spock!

We will play three rounds!
Rock = r
Paper = p
Scissors = sc
Lizard = l
Spock = sp
MSG
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def score_game
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "-------------------------------------------"
    puts "#{human.name} has a score of #{human.score}"
    puts "#{computer.name} has a score of #{computer.score}"
    puts "-------------------------------------------"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n'
    end
    answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        system('clear')
        display_moves
        score_game
        display_winner
        display_score
        break if human.score == 10 || computer.score == 10
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
