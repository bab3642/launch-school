require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=>#{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
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

#todo - find out why this isn't working
def close_win?(brd, line, marker)
  (brd.values_at(*line).count(marker) == 2 && 
  brd.values_at(*line).count(INITIAL_MARKER) == 1)
end

def computer_places_piece!(brd)
  move = 0
  WINNING_LINES.each do |line|
    if close_win?(brd, line, COMPUTER_MARKER)
      move = line.select do |space|
             brd[space] == INITIAL_MARKER
             end
      brd[move[0]] = COMPUTER_MARKER
      return
    
    end
  end
  
  WINNING_LINES.each do |line|
    if close_win?(brd, line, PLAYER_MARKER)
      move = line.select do |space|
             brd[space] == INITIAL_MARKER
             end
      brd[move[0]] = COMPUTER_MARKER
      return
    end
  end
  
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

def count_wins!(board, player, computer)
  detect_winner(board) == 'Player' ? player[:wins] += 1 : computer[:wins] += 1
end


prompt "Welcome to Tic Tac Toe! First to win 5 rounds wins the game! Press any key to continue"
gets.chomp
loop do
  round_counter = 0
  player = {wins: 0}
  computer = {wins: 0}
  loop do
    board = initialize_board
    display_board(board)
  
    loop do
      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
  
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  
    display_board(board)
  
    if someone_won?(board)
      round_counter += 1
      count_wins!(board, player, computer)
      if player[:wins] == 5
        prompt "Player has won the game! #{round_counter} rounds were played"
        break
      elsif computer[:wins] == 5
        prompt "Computer has won the game! #{round_counter} total rounds were played."
        break
      end
      prompt "#{detect_winner(board)} won the round! Player has won #{player[:wins]} rounds and Computer has won #{computer[:wins]} rounds."
      prompt "Press any key to start the next round"
      gets.chomp
    else
      prompt "It's a tie!"
      prompt "Press any key to continue"
      gets.chomp
      round_counter += 1
    end
  end
  prompt "Player won #{player[:wins]} rounds and Computer won #{computer[:wins]} rounds."
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end


prompt "Thanks for playing Tic Tac Toe! Goodbye!"