class Pair < CardsManager
  PRIORITY = 1

  def initialize(cards_pair)
    super cards_pair
    check_cards
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Pair cards must be two') unless @cards.length == 2
    raise CardsManager::CardsError.new('Cards are not of the same value') unless are_same_value?
  end
end