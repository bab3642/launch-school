# TODO move long messages to a HEREDOC
require 'pry'

FACE_CARDS = [:queen, :king, :jack]
HIGHEST_SCORE = 21 # can change to desired score
CARD_DECK = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
SUITS = %i(clubs spades hearts diamonds)
DEALER_STAY = 17 # can change to modify dealer stay behavior

def prompt(msg)
  puts "=>#{msg}"
end

def card_to_string(card_arr)
  "#{card_arr[1].to_s.capitalize} of #{card_arr[0].to_s.capitalize}"
end

def initialize_deck!(deck)
  SUITS.each do |suit|
    deck[suit] = CARD_DECK
  end
end

def switch_player(current_player, dealer, player)
  current_player == player ? dealer : player
end

def deal_cards!(player, dealer, deck)
  card_count = 0
  current_player = player # can change to 'dealer' for dealer to get dealt first
  loop do
    suit = deck.keys.sample
    current_player[:hand] << [suit, deck[suit].sample]
    deck[suit].delete(current_player[:hand].last.last)
    card_count += 1
    current_player = switch_player(current_player, player, dealer)
    break if card_count == 4
  end
end

def player_turn!(hand, deck)
  score = prompt_hit_or_stay!(hand, deck)
  if bust?(score)
    prompt "You busted with a score of #{score}!"
  else
    prompt "You chose to stay with a score of #{score}!"
  end
end

def prompt_hit_or_stay!(hand, deck)
  loop do
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase
    if answer == 'stay' || answer == 's'
      return score(hand)
    elsif answer == "hit" || answer == 'h'
      hit!(hand, deck)
      score = score(hand)
      if bust?(score)
        return score
      end
    else
      prompt "Invalid input."
    end
  end
end

def hit!(hand, deck)
  new_card = draw_card!(deck)
  prompt "You drew a #{card_to_string(new_card)}"
  update_hand!(hand, new_card)
  prompt "You now have: #{display_hand(hand)}"
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

def score(hand)
  values = hand.map do |card|
    FACE_CARDS.include?(card.last) ? 10 : card.last
  end
  values.include?(:ace) ? score_aces!(values) : values.sum
end

def score_aces!(values)
  count = values.count(:ace)
  values.delete(:ace)
  sum = values.sum
  count.times { sum += 11 }
  count.times { sum -= 10 if sum > HIGHEST_SCORE }
  sum
end

def dealer_turn!(hand, deck)
  reveal_unknown_card(hand)
  score = dealer_hit_or_stay!(hand, deck)
  if bust?(score)
    prompt "Dealer busted!"
  else
    prompt "Dealer stays with a score of #{score}."
  end
end

def dealer_hit_or_stay!(hand, deck)
  loop do
    score = score(hand)
    prompt "Dealer has: #{display_hand(hand)} with a score of #{score}"
    if score < DEALER_STAY
      new_card = draw_card!(deck)
      prompt "Dealer drew a #{card_to_string(new_card)}"
      update_hand!(hand, new_card)
    else
      return score
    end
  end
end

def reveal_unknown_card(hand)
  prompt "Dealer's hidden card is: #{card_to_string(hand[1])}."
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

def display_hand(hand)
  string = ''
  hand.each_with_index do |card, index|
    if index == (hand.length - 1)
      string << " and #{card_to_string(card)}"
    elsif index == (hand.length - 2)
      string << card_to_string(card)
    else
      string << "#{card_to_string(card)}, "
    end
  end
  string
end

player = { wins: 0 }
dealer = { wins: 0 }
loop do
  system "clear"
  deck = {}
  initialize_deck!(deck)
  player[:hand] = []
  dealer[:hand] = []
  deal_cards!(player, dealer, deck)

  prompt "Dealer has: #{card_to_string(dealer[:hand][0])} and unknown card"
  prompt "You have: #{display_hand(player[:hand])}"

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
  case winner
  when "tie"
    prompt "It's a tie"
  when "Player"
    prompt "#{winner} wins!"
    player[:wins] += 1
  when "Dealer"
    prompt "#{winner} wins!"
    dealer[:wins] += 1
  end
  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp.downcase
  break unless answer == 'y' || answer == 'yes'
end

prompt "You won #{player[:wins]} times and dealer won #{dealer[:wins]} times."
prompt "Thanks for playing. Goodbye!"
