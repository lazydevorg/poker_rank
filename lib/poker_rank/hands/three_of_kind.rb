class ThreeOfKind < CardsManager
  PRIORITY = 3

  def initialize(cards)
    super cards
    check_cards
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Cards must be three') unless @cards.length == 3
    raise CardsManager::CardsError.new('Cards must be same value') unless are_same_value?
  end
end