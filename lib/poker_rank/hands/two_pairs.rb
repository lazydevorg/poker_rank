class TwoPairs
  PRIORITY = 2
  include Comparable

  attr_reader :pairs

  def initialize(pairs)
    @pairs = pairs
    check_pairs
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