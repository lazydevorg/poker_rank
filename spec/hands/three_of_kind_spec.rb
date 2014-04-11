require 'spec_helper'

describe ThreeOfKind do
  context 'with valid data' do
    it 'accepts three cards' do
      cards = [
          Card.new('3', :D),
          Card.new('3', :S),
          Card.new('3', :H)
      ]
      expect do
        ThreeOfKind.new cards
      end.not_to raise_error
    end

    it 'detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S),
          Card.new('4', :C),
          Card.new('T', :C)
      ]
      expect{ThreeOfKind.new_from_hand(cards)}.not_to raise_error
    end
  end

  context 'with not valid data' do
    it 'not accepts less then three cards' do
      cards = [
          Card.new('3', :D),
          Card.new('3', :S)
      ]
      expect do
        ThreeOfKind.new cards
      end.to raise_error
    end

    it 'not accepts more then three cards' do
      cards = [
          Card.new('3', :D),
          Card.new('3', :S),
          Card.new('3', :H),
          Card.new('3', :C)
      ]
      expect do
        ThreeOfKind.new cards
      end.to raise_error
    end

    it 'not detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('3', :S),
          Card.new('4', :C),
          Card.new('T', :C)
      ]
      expect{ThreeOfKind.new_from_hand(cards)}.to raise_error
    end
  end
end