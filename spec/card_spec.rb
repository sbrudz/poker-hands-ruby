# frozen_string_literal: true

require 'spec_helper'
require 'card'

describe 'card' do
  valid_suits = %w[S C H D]
  valid_ranks = %w[2 3 4 5 6 7 8 9 T J Q K A]

  context 'valid card' do
    let(:card) { Card.new('8C') }

    it 'has a suit' do
      expect(card).to respond_to(:suit)
    end

    it 'has a rank' do
      expect(card).to respond_to(:rank)
    end

    it 'is initialized with suit and rank' do
      expect(card.rank).to eq '8'
      expect(card.suit).to eq 'C'
    end

    it 'identifies identical cards' do
      expect(Card.new('8C')).to eq Card.new('8C')
    end

    it 'identifies different cards' do
      expect(Card.new('3H')).to_not eq Card.new('3S')
    end
  end

  context 'validation' do
    valid_suits.each do |suit|
      valid_ranks.each do |rank|
        it "#{rank} of #{suit} is valid" do
          expect(Card.new(rank + suit)).to_not be_nil
        end
      end
    end

    it 'raises on invalid suit' do
      expect { Card.new('2F') }.to raise_error(ArgumentError, /Invalid suit/)
    end

    it 'raises on invalid rank' do
      expect { Card.new('1C') }.to raise_error(ArgumentError, /Invalid rank/)
    end

    it 'case insensitive rank and suit' do
      expect(Card.new('jc')).to_not be_nil
    end
  end

  context 'deck' do
    let(:deck) { Card.deck }

    it 'has 52 cards a full deck' do
      expect(deck.count).to eq 52
    end

    it 'has one of each rank and suit' do
      valid_suits.each do |suit|
        valid_ranks.each do |rank|
          card = Card.new(rank + suit)
          expect(deck.include?(card)).to eq true
        end
      end
    end
  end
end
