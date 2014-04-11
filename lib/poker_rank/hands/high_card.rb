module PokerRank
  class HighCard < CardsManager
    PRIORITY = 0

    def self.new_from_hand(cards)
      new cards
    end

    def self.compare_hands(cards1, cards2)
      high_card = HighCard.new cards1
      high_card <=> cards2
    end

    def <=>(other)
      @cards.sort.zip(other.cards.sort).each do |card_pair|
        card = card_pair[0]
        other_card = card_pair[1]
        return card <=> other_card if card != other_card
      end
      return 0
    end
  end
end