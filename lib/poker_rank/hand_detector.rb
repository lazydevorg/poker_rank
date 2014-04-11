class HandDetector
  HANDS_CLASSES = [
      StraightFlush,
      FourOfKind,
      FullHouse,
      Flush,
      Straight,
      ThreeOfKind,
      TwoPairs,
      Pair
  ]

  def self.get_hand_from_cards(cards)
    catch :hand do
      HANDS_CLASSES.each do |hand_class|
        begin
          hand = hand_class.new_from_hand cards
          throw :hand, hand
        rescue CardsManager::CardsError
        end
      end
      return nil
    end
  end
end