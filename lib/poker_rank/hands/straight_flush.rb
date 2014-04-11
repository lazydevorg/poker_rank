class StraightFlush < CardsManager
  PRIORITY = 8

  def initialize(cards)
    super cards
    check_cards
  end

  def self.new_from_hand(hand)

  end

  def rank
    @cards.max.rank
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Cards must be five') unless @cards.length == 5
    raise CardsManager::CardsError.new('Cards are not of the same suit') unless are_same_suit?
    raise CardsManager::CardsError.new('Cards are not consecutives') unless are_consecutive_values?
  end
end