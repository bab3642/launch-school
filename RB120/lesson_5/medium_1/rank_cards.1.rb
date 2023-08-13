require 'pry'

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    value = nil
    if rank.class == String
      value = string_to_num(rank)
    else
      value = rank
    end
    other_val = nil
    if other.rank.class == String
      other_val = string_to_num(other.rank)
    else
      other_val = other.rank
    end
    return value <=> other_val unless (value <=> other_val) == 0
    compare_suits(other)
  end

  def string_to_num(string)
    case string
    when 'Ace'
      15
    when 'King'
      14
    when 'Queen'
      13
    when 'Jack'
      12
    end
  end

  def compare_suits(other)
    val = suit_to_num(suit)
    other_val = suit_to_num(other.suit)
    val <=> other_val
  end

  def suit_to_num(suit)
    case suit
    when 'Spades'
      4
    when 'Hearts'
      3
    when 'Clubs'
      2
    when 'Diamonds'
      1
    end
  end

  def ==(other)
    rank == other.rank
  end
end



cards = [Card.new(2, 'Hearts'),
         Card.new(2, 'Diamonds'),
         Card.new(2, 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Diamonds')
puts cards.max == Card.new(2, 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8