require 'spec_helper'

module PokerRank
  describe HandDetector do
    it 'detect a StraightFlush' do
      cards = [
        Card.new('2', :D),
        Card.new('3', :D),
        Card.new('4', :D),
        Card.new('5', :D),
        Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a StraightFlush
    end

    it 'detect a FourOfKind' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S),
          Card.new('2', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a FourOfKind
    end

    it 'detect a FullHouse' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S),
          Card.new('3', :C),
          Card.new('3', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a FullHouse
    end

    it 'detect a Flush' do
      cards = [
          Card.new('2', :D),
          Card.new('3', :D),
          Card.new('7', :D),
          Card.new('T', :D),
          Card.new('J', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a Flush
    end

    it 'detect a Straight' do
      cards = [
          Card.new('2', :D),
          Card.new('3', :H),
          Card.new('4', :S),
          Card.new('5', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a Straight
    end

    it 'detect a ThreeOfKind' do
      cards = [
          Card.new('T', :D),
          Card.new('T', :H),
          Card.new('T', :S),
          Card.new('5', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a ThreeOfKind
    end

    it 'detect a TwoPairs' do
      cards = [
          Card.new('T', :D),
          Card.new('T', :H),
          Card.new('5', :S),
          Card.new('5', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a TwoPairs
    end

    it 'detect a Pair' do
      cards = [
          Card.new('T', :D),
          Card.new('T', :H),
          Card.new('2', :S),
          Card.new('5', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_a Pair
    end

    it 'detect nothing' do
      cards = [
          Card.new('T', :D),
          Card.new('A', :H),
          Card.new('2', :S),
          Card.new('5', :C),
          Card.new('6', :D)
      ]
      hand = nil
      expect do
        hand = HandDetector.get_hand_from_cards cards
      end.not_to raise_error
      expect(hand).to be_nil
    end
  end
end