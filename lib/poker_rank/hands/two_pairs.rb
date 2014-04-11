class TwoPairs
  PRIORITY = 2
  include Comparable

  attr_reader :pairs

  def initialize(pairs)
    @pairs = pairs
    check_pairs
  end

  def self.new_from_hand(cards)
    pair1 = Pair.new_from_hand cards
    cards -= pair1.cards
    pair2 = Pair.new_from_hand cards
    return self.new [pair1, pair2]
  end

  def rank
    @pairs.max.rank
  end

  def <=>(two_pairs)
    rank <=> two_pairs
  end

  protected

  def check_pairs
    raise CardsManager::CardsError.new('Pairs must be two') unless @pairs.length == 2
  end
end