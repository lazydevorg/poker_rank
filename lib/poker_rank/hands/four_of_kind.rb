module PokerRank
  class FourOfKind < CardsManager
    PRIORITY = 7

    def initialize(cards)
      super cards
      check_cards
    end

    def self.new_from_hand(cards)
      manager = CardsManager.new cards
      groups = manager.groups_by_value_with_length 4
      return self.new(groups[0]) if groups.length > 0
      raise CardsManager::CardsError.new('Cards not valids')
    end

    protected

    def check_cards
      raise CardsManager::CardsError.new('Cards must be four') unless @cards.length == 4
      raise CardsManager::CardsError.new('Cards are not of the same value') unless are_all_same_value?
    end
  end
end