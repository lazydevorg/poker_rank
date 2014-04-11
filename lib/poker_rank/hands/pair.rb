class Pair < CardsManager
  PRIORITY = 1

  def initialize(cards_pair)
    super cards_pair
    check_cards
  end

  def self.new_from_hand(cards)
    manager = CardsManager.new cards
    groups = manager.groups_by_value_with_length 2
    return self.new(groups[0]) if groups.length > 0
    raise CardsManager::CardsError.new('Cards not valids')
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Pair cards must be two') unless @cards.length == 2
    raise CardsManager::CardsError.new('Cards are not of the same value') unless are_all_same_value?
  end
end