require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 5

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=>#{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an '#{PLAYER_MARKER}'. Computer is an '#{COMPUTER_MARKER}'."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def joinor(array, separator = ', ', word = 'or')
  string = ''
  array.each_with_index do |element, index|
    if array.length == 1
      return element.to_s
    elsif array.length == 2
      string << "#{element} #{word} #{array[1]}"
      return string
    elsif index != (array.length - 1)
      string << "#{element}#{separator}"
    else
      string << "#{word} #{element}"
    end
  end
  string
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def close_win?(brd, line, marker)
  (brd.values_at(*line).count(marker) == 2 &&
  brd.values_at(*line).count(INITIAL_MARKER) == 1)
end

def wise_move!(brd, marker)
  move = 0
  WINNING_LINES.each do |line|
    if close_win?(brd, line, marker)
      move = line.select do |space|
        brd[space] == INITIAL_MARKER
      end
      brd[move[0]] = COMPUTER_MARKER
      return true
    end
  end
  false
end

def computer_places_piece!(brd)
  return if wise_move!(brd, COMPUTER_MARKER)
  return if wise_move!(brd, PLAYER_MARKER)

  if brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def count_wins!(board, player, computer)
  detect_winner(board) == 'Player' ? player[:wins] += 1 : computer[:wins] += 1
end

def who_first?
  prompt "Would you like to let Computer go first? (y/n)"
  prompt "('c' to let Computer decide who goes first)"
  input = gets.chomp
  if input.downcase == 'c'
    [true, false].sample
  else
    input.downcase.start_with?('y')
  end
end

def place_piece!(brd, player)
  case player
  when "Player"
    player_places_piece!(brd)
  when "Computer"
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def play_game(board, current_player)
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
end

prompt <<-MSG
Welcome to Tic Tac Toe! First to win 5 rounds wins the game!#{' '}
Press any key to continue
MSG

gets.chomp
loop do
  current_player = (who_first? ? "Computer" : "Player")
  prompt "#{current_player} goes first!"
  sleep(1)
  puts "Initializing..."
  sleep(3)
  round_counter = 0
  player = { wins: 0 }
  computer = { wins: 0 }
  loop do
    board = initialize_board
    display_board(board)

    play_game(board, current_player)
    display_board(board)
    
    # Displays winner
    if someone_won?(board)
      round_counter += 1
      count_wins!(board, player, computer)
      if player[:wins] == WINNING_SCORE
        prompt "Player has won the game! #{round_counter} rounds were played"
        break
      elsif computer[:wins] == WINNING_SCORE
        prompt "Computer has won the game! #{round_counter} total rounds were played."
        break
      end
      prompt "#{detect_winner(board)} won the round! Player has won #{player[:wins]} rounds and Computer has won #{computer[:wins]} rounds."
      puts "Press any key to start the next round"
      gets.chomp
    else
      prompt "It's a tie! Player has won #{player[:wins]} rounds and Computer has won #{computer[:wins]} rounds."
      prompt "Press any key to continue"
      gets.chomp
      round_counter += 1
    end
  end
  prompt "Player won #{player[:wins]} rounds and Computer won #{computer[:wins]} rounds."
  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
