module PokerRank
  class Pair < CardsManager
    PRIORITY = 1
    attr_accessor :other_cards

    def initialize(cards_pair)
      super cards_pair
      check_cards
    end

    def self.new_from_hand(cards)
      manager = CardsManager.new cards
      groups = manager.groups_by_value_with_length 2
      pair_cards = groups[0]
      if groups.length > 0
        pair = self.new(pair_cards)
        pair.other_cards = cards - pair_cards
        return pair
      end
      raise CardsManager::CardsError.new('Cards not valids')
    end

    def <=>(pair)
      comparation = @cards <=> pair.cards
      if comparation == 0
        comparation = second_pair <=> two_pairs.rank
        if comparation == 0
          comparation = @last_card <=> two_pairs.last_card
        end
      end
      return comparation
    end

    protected

    def check_cards
      raise CardsManager::CardsError.new('Pair cards must be two') unless @cards.length == 2
      raise CardsManager::CardsError.new('Cards are not of the same value') unless are_all_same_value?
    end
  end
end