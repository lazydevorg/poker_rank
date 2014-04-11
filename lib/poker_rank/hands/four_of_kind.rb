class FourOfKind < CardsManager
  PRIORITY = 7

  def initialize(cards)
    super cards
    check_cards
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Cards must be four') unless @cards.length == 4
    raise CardsManager::CardsError.new('Cards are not of the same value') unless are_same_value?
  end
end