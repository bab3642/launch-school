# TODO: refactor long methods
# TODO move long messages to a HEREDOC
require 'pry'

FACE_CARDS = [:queen, :king, :jack]
HIGHEST_SCORE = 21

def prompt(msg)
  puts "=>#{msg}"
end

def initialize_deck!(deck)
  suits = %i(clubs, spades, hearts, diamonds)
  suits.each do |suit| 
    deck[suit] = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  end
end

def switch_player(current_player, dealer, player)
  current_player == player ? dealer : player
end

def deal_cards!(player, dealer, deck)
  card_count = 0
  current_player = player # can change this later, to change who goes first
  loop do
    suit = deck.keys.sample
    current_player[:hand] << [suit, deck[suit].sample]
    deck[suit].delete(current_player[:hand].last.last)
    card_count += 1
    current_player = switch_player(current_player, player, dealer)
    break if card_count == 4
  end
end

# TODO refactor
def player_turn!(hand, deck)
  score = hit_or_stay(hand, deck)
  if bust?(score)
    puts "You busted with a score of #{score}!"
  else
    puts "You chose to stay with a score of #{score}!"
  end
end

def hit_or_stay(hand, deck)
  answer = nil
  score = 0
  loop do
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase
    if answer == 'stay'
      return score(hand)
    end
    if answer == "hit"
      new_card = draw_card!(deck)
      puts "You drew a #{new_card[1].to_s.capitalize} of #{new_card[0].to_s.capitalize}"
      update_hand!(hand, new_card)
      score = score(hand)
      if bust?(score)
        return score
      end
    end
  end
end

def bust?(score)
  score > HIGHEST_SCORE
end

def draw_card!(deck)
  suit = deck.keys.sample
  new_card = deck[suit].sample
  deck[suit].delete(new_card)
  [suit, new_card]
end

def update_hand!(hand, new_card)
  hand << new_card
end

# TODO: refactor
def score(hand)
  values = hand.map do |card|
    if FACE_CARDS.include?(card.last)
      10
    else
      card.last
    end
  end
  if values.include?(:ace)
    count = values.count(:ace)
    values.delete(:ace)
    sum = values.sum
    count.times do
      sum += 11
    end
    count.times do
      if sum > HIGHEST_SCORE
        sum -= 10
      end
    end
    return sum
  end
  values.sum
end

# TODO refactor
def dealer_turn!(hand, deck)
  reveal_cards(hand)
  score = 0
  loop do
    score = score(hand)
    if score < 17
      new_card = draw_card!(deck)
      puts "Dealer drew a #{new_card[1].to_s.capitalize} of #{new_card[0].to_s.capitalize}"
      update_hand!(hand, new_card)
    else
      break
    end
  end
  if bust?(score)
    puts "Dealer busted with a score of #{score}."
  else
    puts "Dealer's total score is #{score}."
  end
end

def reveal_cards(hand)
  prompt "Dealer's hidden card is: #{hand[1][1].to_s.capitalize} of #{hand[1][0].to_s.capitalize}."
end

def find_winner(dealer_score, player_score)
  if dealer_score > player_score
    "Dealer"
  elsif dealer_score < player_score
    "Player"
  else
    "tie"
  end
end
loop do
  system "clear"
  deck = {}
  initialize_deck!(deck)
  player = { hand: [], wins: 0 }
  dealer = { hand: [], wins: 0 }
  deal_cards!(player, dealer, deck)

  # TODO - These need to be changed to update how many cards the person has, turn into method
  # TODO - extract these long messages to a HEREDOC
  prompt "Dealer has: #{dealer[:hand][0][1].to_s.capitalize} of #{dealer[:hand][0][0].to_s.capitalize} and unknown card"
  prompt "You have: #{player[:hand][0][1].to_s.capitalize} of #{player[:hand][0][0].to_s.capitalize} and #{player[:hand][1][1].to_s.capitalize} of #{player[:hand][1][0].to_s.capitalize}"

  prompt "Player turn:"
  player_turn!(player[:hand], deck)
  if bust?(score(player[:hand]))
    dealer[:wins] += 1
    prompt "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
    system "clear"
    next
  end

  prompt "Dealer's turn:"
  dealer_turn!(dealer[:hand], deck)
  if bust?(score(dealer[:hand]))
    prompt "You win!"
    player[:wins] += 1
    prompt "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
    system "clear"
    next
  end

  winner = find_winner(score(dealer[:hand]), score(player[:hand]))
  if winner == "tie"
    prompt "It's a tie!"
  else
    prompt "#{winner} wins!"
  end
  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing. Goodbye!"
