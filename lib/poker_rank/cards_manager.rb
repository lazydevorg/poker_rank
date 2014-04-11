class CardsManager
  include Comparable
  attr_reader :cards

  def initialize(cards)
    @cards = cards.to_a.sort.reverse
  end

  def rank
    @cards.inject(0) { |sum, card| sum + card.rank }
  end

  def are_all_same_suit?
    all_suits.length == 1
  end

  def all_suits
    @cards.map(&:suit).uniq
  end

  def are_all_same_value?
    all_values.length == 1
  end

  def all_values
    @cards.map(&:value).uniq
  end

  def are_consecutive_values?
    @cards.each_cons(2).all? { |a, b| a.rank - b.rank == 1 }
  end

  def group_by_suit
    @cards.group_by { |card| card.suit }
  end

  def group_by_value
    @cards.group_by { |card| card.value }
  end

  def groups_by_value_with_length(length)
    group_by_value.select{ |value, group| group.length == length }.values
  end

  def <=>(cards)
    rank <=> cards.rank
  end

  class CardsError < StandardError; end
end