require 'spec_helper'

describe Pair do
  context 'with valid data' do
    it 'accepts two cards' do
      expect do
         pair = Pair.new([
               Card.new('2', :D),
               Card.new('2', :S)
           ])
      end.not_to raise_error
    end

    it 'detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('3', :S),
          Card.new('4', :C),
          Card.new('T', :C)
      ]
      expect{Pair.new_from_hand(cards)}.not_to raise_error
    end
  end

  context 'with not valid data' do
    it 'not accepts less then two cards' do
      expect do
        pair = Pair.new([
                            Card.new('2', :D),
                        ])
      end.to raise_error
    end

    it 'not accepts more then two cards' do
      expect do
        pair = Pair.new([
              Card.new('2', :D),
              Card.new('3', :D),
              Card.new('4', :D)
          ])
      end.to raise_error
    end

    it 'not accepts different suit cards' do
      expect do
        pair = Pair.new([
              Card.new('2', :D),
              Card.new('3', :S)
          ])
      end.to raise_error
    end

    it 'not detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('5', :H),
          Card.new('3', :S),
          Card.new('4', :C),
          Card.new('T', :C)
      ]
      expect{Pair.new_from_hand(cards)}.to raise_error
    end
  end
end