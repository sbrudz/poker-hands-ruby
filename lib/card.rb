# frozen_string_literal: true

class Card
  attr_reader :suit
  attr_reader :rank

  SUITS = %w[C S H D].freeze
  RANKS = ('2'..'9').to_a.concat(%w[T J Q K A])

  def initialize(face)
    rank = face[0].capitalize
    suit = face[1].capitalize
    raise ArgumentError, "Invalid rank:#{rank}" unless RANKS.include? rank
    raise ArgumentError, "Invalid suit:#{suit}" unless SUITS.include? suit

    @rank = rank
    @suit = suit
  end

  def ==(other)
    rank == other.rank &&
      suit == other.suit
  end

  def self.deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank + suit)
      end
    end
    deck.shuffle
  end
end
