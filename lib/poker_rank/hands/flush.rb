module PokerRank
  class Flush < CardsManager
    PRIORITY = 5

    def initialize(cards)
      super cards
      check_cards
    end

    def rank
      @cards.first.rank
    end

    def self.new_from_hand(cards)
      new cards
    end

    def <=>(other)
      HighCard.compare_hands @cards.sort, other.cards.sort
    end

    protected

    def check_cards
      raise CardsManager::CardsError.new('Cards must be five') unless @cards.length == 5
      raise CardsManager::CardsError.new('Cards are not of the same suit') unless are_all_same_suit?
    end
  end
end