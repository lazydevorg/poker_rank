class Straight < CardsManager
  PRIORITY = 4

  def initialize(cards)
    super cards
    check_cards
  end

  def rank
    @cards.max.rank
  end

  protected

  def check_cards
    raise CardsManager::CardsError.new('Cards must be five') unless @cards.length == 5
    raise CardsManager::CardsError.new('Cards are not consecutives') unless are_consecutive_values?
  end
end