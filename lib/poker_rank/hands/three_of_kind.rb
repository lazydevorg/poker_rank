module PokerRank
  class ThreeOfKind < CardsManager
    PRIORITY = 3

    def initialize(cards)
      super cards
      check_cards
    end

    def self.new_from_hand(cards)
      manager = CardsManager.new cards
      groups = manager.groups_by_value_with_length 3
      return self.new(groups[0]) if groups.length > 0
      raise CardsManager::CardsError.new('Cards not valids')
    end

    protected

    def check_cards
      raise CardsManager::CardsError.new('Cards must be three') unless @cards.length == 3
      raise CardsManager::CardsError.new('Cards must be same value') unless are_all_same_value?
    end
  end
end