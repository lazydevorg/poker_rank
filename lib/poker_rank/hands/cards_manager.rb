class CardsManager
  include Comparable
  attr_reader :cards

  def initialize(cards)
    @cards = cards.to_a.sort.reverse
  end

  def rank
    @cards.inject(0) { |sum, card| sum + card.rank }
  end

  def are_same_suit?
    @cards.map(&:suit).uniq.length == 1
  end

  def are_same_value?
    @cards.map(&:value).uniq.length == 1
  end

  def are_consecutive_values?
    @cards.each_cons(2).all? { |a, b| a.rank - b.rank == 1 }
  end

  def <=>(cards)
    rank <=> cards.rank
  end

  class CardsError < StandardError; end
end