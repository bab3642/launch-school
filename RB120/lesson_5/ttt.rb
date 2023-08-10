require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_markers?(squares, num_identical: 3)
        return squares.first.marker
      end
    end
    nil
  end

  def close_win?(marker)
    !!winning_square(marker)
  end


  # Find the rows that have two out of three marked for that marker
    # Iterate over the winning lines. Check if squares identical for TWO
  # Return the empty space
  #
  def winning_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_markers?(squares, num_identical: 2)
        return empty_spot(line).first
      end
    end
    nil
  end

  def empty_spot(line)
    line.select { |num| @squares[num].marker == Square::INITIAL_MARKER }
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def identical_markers?(squares, num_identical: 3)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != num_identical
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
  attr_accessor :score

  def initialize(marker)
    if marker.equal?(TTTGame::HUMAN_MARKER)
      @name = choose_name
      @marker = choose_marker
    else
      @name = ['Fred', 'Frank', 'Ferdinand', 'Fiona', 'Felicia'].sample
      @marker = marker
    end
    @score = 0

  end

  private

  attr_writer :marker, :name

  def choose_marker
    input = nil
    loop do
      puts "Choose your marker! Enter any single digit string:"
      input = gets.chomp.strip
      break if input.size == 1 && input != ' '
      puts "Error. Please enter a valid marker."
    end
    input
  end

  def choose_name
    input = nil
    loop do
      puts "Enter your name:"
      input = gets.chomp.strip
      break unless input.empty?
      puts "Please use a valid name."
    end
    input
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  # FIRST_TO_MOVE = HUMAN_MARKER
  MAX_WINS = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = human.marker # determines who goes first
  end




  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      play_rounds
      break unless play_again?
      reset_game
      display_play_again_message
    end
  end

  def play_rounds
    loop do
      display_board
      player_moves
      display_result
      break if human.score == MAX_WINS || computer.score == MAX_WINS
      break if quit?
      reset_round
    end
  end

  def quit?
    puts "Press 'q' to quit or any other button to continue"
    input = gets.chomp.downcase
    input == 'q'
  end

  def player_moves
    loop do
      current_player_moves
      if board.someone_won?
        score_game
        break
      elsif board.full?
        break
      end
      clear_screen_and_display_board if human_turn?
    end
  end

  def score_game
    board.winning_marker == human.marker ? human.score += 1 : computer.score += 1
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}!"
    puts "Your opponent will be: #{computer.name}."
    puts ''
    puts "First player to win #{MAX_WINS} rounds wins the game!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye #{human.name}!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def joinor(array, separator = ', ', word = 'or')
    if array.size == 1
      array[0].to_s
    elsif array.size == 2
      "#{array[0]} #{word} #{array[1]}"
    else
      string = array[0..-2].join(separator) + separator
      "#{string}#{word} #{array.last}"
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end


  def computer_moves
    if board.close_win?(computer.marker)
      board[board.winning_square(computer.marker)] = computer.marker # TODO
    elsif board.close_win?(human.marker) # TODO
      board[board.winning_square(human.marker)] = computer.marker
    elsif board.unmarked_keys.include?(5)
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won! The score is:"
      puts "#{human.name}: #{human.score} #{computer.name}: #{computer.score}"
    when computer.marker
      puts "#{computer.name} won! The score is:"
      puts "#{human.name}: #{human.score} #{computer.name}: #{computer.score}"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play to #{MAX_WINS} wins again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset_game
    reset_round
    human.score = 0
    computer.score = 0
  end

  def reset_round
    board.reset
    @current_marker = human.marker
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
