class HighCard < CardsManager
  PRIORITY = 0

  def self.new_from_hand(cards)
    new cards
  end
end