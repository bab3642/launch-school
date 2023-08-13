require 'pry'
## I STARTED trying to work on the further exploration which broke everything,
# and I forgot to commit before that. RIP!




class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  attr_reader :cards

  def initialize
    @cards = []
    create_cards
    cards.shuffle!
  end

  def create_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
  end

  def draw
    val = cards.pop
    if cards.empty?
      create_cards
    end
    val
  end

end




class PokerHand

  def initialize(deck)
    @deck = deck
    @hand = []
    7.times { @hand << @deck.draw }
  end


  def print
    hand.each do |card|
      puts card
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end


  attr_reader :hand

  def royal_flush?
    cards = flush?
    if cards.map(&:value).all?{|val|[10, 11, 12, 13, 14].include?(val)}
      return cards
    end
    false
  end

  def straight_flush?
    straight? == flush?  # TODO
    return flush?
  end

  def four_of_a_kind?
    ranks = hand.collect(&:rank)
    ranks.any? { |value| ranks.count(value) == 4 }
    # Return the four cards plus the highest rank card
  end

  def full_house?
    ranks = hand.collect(&:rank)
    double_count = 0; triple_count = 0
    ranks.each do |rank|
      if ranks.count(rank) == 3
        ranks.delete(rank)
        triple_count += 1
      end
      if ranks.count(rank) == 2
        ranks.delete(rank)
        double_count += 1
      end
      return true if triple_count == 1 && double_count == 1
    end
    false
    # return those 5 cards of highest rank
  end

  def flush?
    if hand.all? { |card| card.suit == hand.first.suit }
      return sort_by_rank(hand)[2..-1]
    else
    sorted = sort_by_rank(hand)
    sorted.select! { |card| sorted.map(&:suit).count(card.suit) >= 5 }
    if sorted.size > 5
      loop do
        sorted.shift
        break if sorted.size == 5
      end
    end
     return sorted if sorted.size == 5
    end
    false
  end

  def straight?
    ordered = hand.map(&:value).sort
    ordered.each_with_index do |num, idx|
      return true if idx == ordered.size - 1
      return false if (num + 1) != ordered[idx + 1]
    end
    true
    1 2 2 3 4 5 5
    # return the straight of highest rank
  end

  def three_of_a_kind?
    ranks = hand.collect(&:rank)
    ranks.any? { |value| ranks.count(value) == 3 }
    # return the three of a kind of highest rank and then the two highest rank cards
  end

  def two_pair?
    ranks = hand.collect(&:rank)
    count = 0
    ranks.each do |rank|
      if ranks.count(rank) == 2
        ranks.delete(rank)
        count += 1
      end
      return true if count == 2
    end
    false
    # return the two pair of highest rank and then the highest rank card
  end

  def pair?
    ranks = hand.collect(&:rank)
    ranks.any? { |value| ranks.count(value) == 2 }
    # return the pair of highest rank and then the 3 highest rank cards
  end

  def sort_by_rank(hand)
    hand.sort_by { |card| card.value }
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end


# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.flush?(hand)

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts'),
  Card.new(8,       'Clubs'),
  Card.new(8,       'Clubs'),
])
puts hand.royal_flush?

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Clubs'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Spades'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts'),
  Card.new(3, 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.flush?

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'

# class Card
#   attr_reader :rank, :suit

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   def <=>(other)
#     value = nil
#     if rank.class == String
#       value = string_to_num(rank)
#     else
#       value = rank
#     end
#     other_val = nil
#     if other.rank.class == String
#       other_val = string_to_num(other.rank)
#     else
#       other_val = other.rank
#     end
#     value <=> other_val
#   end

#   def string_to_num(string)
#     case string
#     when 'Ace'
#       15
#     when 'King'
#       14
#     when 'Queen'
#       13
#     when 'Jack'
#       12
#     end
#   end

#   def ==(other)
#     rank == other.rank
#   end
# end