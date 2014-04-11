require 'spec_helper'

module PokerRank
  describe HandsComparator do
    it 'compare two hands correctly' do
      hand1 = [
        Card.new('2', :D),
        Card.new('3', :D),
        Card.new('4', :D),
        Card.new('5', :D),
        Card.new('6', :D)
      ]
      hand2 = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('4', :D),
          Card.new('5', :C),
          Card.new('T', :D)
      ]
      comparator = HandsComparator.new hand1, hand2
      expect(comparator.compare_cards).to be == 1
    end
  end
end