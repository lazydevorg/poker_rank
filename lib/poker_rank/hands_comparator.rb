module PokerRank
  class HandsComparator
    def initialize(cards1, cards2)
      @cards1 = cards1
      @cards2 = cards2
    end

    def compare_cards
      hand1 = HandDetector.get_hand_from_cards @cards1
      hand2 = HandDetector.get_hand_from_cards @cards2
      comparation = hand1.class::PRIORITY <=> hand2.class::PRIORITY
      if comparation == 0
        comparation = hand1 <=> hand2
      end
      return comparation
    end
  end
end