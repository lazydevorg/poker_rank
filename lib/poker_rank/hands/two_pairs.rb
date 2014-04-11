module PokerRank
  class TwoPairs
    PRIORITY = 2
    include Comparable

    attr_reader :pairs
    attr_accessor :last_card

    def initialize(pairs)
      @pairs = pairs
      check_pairs
    end

    def self.new_from_hand(cards)
      pair1 = Pair.new_from_hand cards
      cards -= pair1.cards
      pair2 = Pair.new_from_hand cards
      cards -= pair2.cards
      two_pairs = self.new [pair1, pair2]
      two_pairs.last_card = cards[0]
      return two_pairs
    end

    def rank
      @pairs.max.rank
    end

    def first_pair
      @pairs[0]
    end

    def second_pair
      @pairs[1]
    end

    def <=>(two_pairs)
      comparation = first_pair <=> two_pairs.rank
      if comparation == 0
        comparation = second_pair <=> two_pairs.rank
        if comparation == 0
          comparation = @last_card <=> two_pairs.last_card
        end
      end
      return comparation
    end

    protected

    def check_pairs
      raise CardsManager::CardsError.new('Pairs must be two') unless @pairs.length == 2
    end
  end
end