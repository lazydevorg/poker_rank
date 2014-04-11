module PokerRank
  class FullHouse
    include Comparable
    PRIORITY = 6

    attr_reader :three_of_kind, :pair

    def initialize(three_of_kind, pair)
      @three_of_kind = three_of_kind
      @pair = pair
    end

    def self.new_from_hand(cards)
      three_of_kind = ThreeOfKind.new_from_hand cards
      cards -= three_of_kind.cards
      pair = Pair.new_from_hand cards
      return self.new three_of_kind, pair
    end

    def rank
      @three_of_kind.rank
    end

    def <=>(full_house)
      rank <=> full_house
    end
  end
end
