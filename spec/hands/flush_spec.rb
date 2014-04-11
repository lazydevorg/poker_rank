require 'spec_helper'

describe Flush do
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

    it 'accept valid flush' do
      expect{Flush.new(cards)}.not_to raise_error
    end

    it 'has valid rank' do
      expect(Flush.new(cards).rank).to be == 6
    end

    it 'detects itself correctly' do
      expect{Flush.new_from_hand(cards)}.not_to raise_error
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
      expect{Flush.new(cards)}.to raise_error
    end

    it 'accept only same suit' do
      cards = [
          Card.new('2', :D),
          Card.new('3', :D),
          Card.new('4', :D),
          Card.new('5', :D),
          Card.new('6', :S)
      ]
      expect{Flush.new(cards)}.to raise_error
    end

    it 'not detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('3', :D),
          Card.new('4', :D),
          Card.new('5', :D),
          Card.new('6', :S)
      ]
      expect{Flush.new_from_hand(cards)}.to raise_error
    end
  end
end