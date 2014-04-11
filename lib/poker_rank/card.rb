module PokerRank
  class Card
    include Comparable

    SUITS = %i(C D H S)
    FACE_VALUES = {
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        'T' => 10,
        'J' => 11,
        'Q' => 12,
        'K' => 13,
        'A' => 14
    }

    attr_reader :value, :suit

    def initialize(value, suit)
      set_value(value)
      set_suit(suit)
    end

    def rank
      FACE_VALUES[@value]
    end

    def to_s
      "#{@value}#{@suit}"
    end

    def <=>(card)
      value <=> card.value
    end

    class NotValidValueError < StandardError; end
    class NotValidSuitError < StandardError; end

    protected

    def set_suit(suit)
      check_suit suit
      @suit = suit
    end

    def check_suit(suit)
      raise NotValidSuitError unless SUITS.include? suit
    end

    def set_value(value)
      check_value value
      @value = value
    end

    def check_value(value)
      raise NotValidValueError unless FACE_VALUES.keys.include? value
    end
  end
end
