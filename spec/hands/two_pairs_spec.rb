require 'spec_helper'

describe TwoPairs do
  context 'with valid data' do
    it 'accepts two pairs' do
      pair1 = Pair.new([
                           Card.new('2', :D),
                           Card.new('2', :S)
                       ])
      pair2 = Pair.new([
                           Card.new('5', :S),
                           Card.new('5', :D)
                       ])
      expect do
        TwoPairs.new [pair1, pair2]
      end.not_to raise_error
    end

    it 'has valid rank' do
      pair1 = Pair.new([
                           Card.new('2', :D),
                           Card.new('2', :S)
                       ])
      pair2 = Pair.new([
                           Card.new('T', :D),
                           Card.new('T', :S)
                       ])
      two_pairs = TwoPairs.new [pair1, pair2]
      expect(two_pairs.rank).to be == 20
    end

    it 'detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('3', :S),
          Card.new('3', :C),
          Card.new('T', :C)
      ]
      expect{TwoPairs.new_from_hand(cards)}.not_to raise_error
    end
  end

  context 'with not valid data' do
    it 'not accepts less then two pairs' do
      pair1 = Pair.new([
                           Card.new('3', :S),
                           Card.new('3', :D)
                       ])
      expect do
        TwoPairs.new [pair1]
      end.to raise_error
    end

    it 'not accepts more then two cards' do
      pair1 = Pair.new([
                           Card.new('3', :S),
                           Card.new('3', :D)
                       ])
      pair2 = Pair.new([
                           Card.new('5', :S),
                           Card.new('5', :H)
                       ])
      pair3 = Pair.new([
                           Card.new('8', :H),
                           Card.new('8', :S)
                       ])
      expect do
        TwoPairs.new [pair1, pair2, pair3]
      end.to raise_error
    end

    it 'not detects itself correctly' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('4', :S),
          Card.new('3', :C),
          Card.new('T', :C)
      ]
      expect{TwoPairs.new_from_hand(cards)}.to raise_error
    end
  end
end