require 'spec_helper'

module PokerRank
  describe StraightFlush do
    context 'with valid data' do
      let(:cards) {
        [
            Card.new('2', :D),
            Card.new('3', :D),
            Card.new('4', :D),
            Card.new('5', :D),
            Card.new('6', :D)
        ]
      }

      it 'accept valid StraightFlush' do
        expect{StraightFlush.new(cards)}.not_to raise_error
      end

      it 'has valid rank' do
        expect(StraightFlush.new(cards).rank).to be == 6
      end

      it 'detects itself correctly' do
        expect{StraightFlush.new_from_hand(cards)}.not_to raise_error
      end
    end

    context 'with invalid data' do
      it 'accept only five cards' do
        cards = [
            Card.new('2', :D),
            Card.new('3', :D),
            Card.new('4', :D),
            Card.new('5', :D)
        ]
        expect{StraightFlush.new(cards)}.to raise_error
      end

      it 'accept only same suit' do
        cards = [
            Card.new('2', :D),
            Card.new('3', :D),
            Card.new('4', :D),
            Card.new('5', :D),
            Card.new('6', :S)
        ]
        expect{StraightFlush.new(cards)}.to raise_error
      end

      it 'accept only consecutive values' do
        cards = [
            Card.new('2', :D),
            Card.new('3', :D),
            Card.new('4', :D),
            Card.new('5', :D),
            Card.new('8', :D)
        ]
        expect{StraightFlush.new(cards)}.to raise_error
      end

      it 'not detects itself correctly' do
        cards = [
            Card.new('2', :D),
            Card.new('3', :D),
            Card.new('4', :D),
            Card.new('5', :D),
            Card.new('8', :D)
        ]
        expect{StraightFlush.new_from_hand(cards)}.to raise_error
      end
    end
  end
end
