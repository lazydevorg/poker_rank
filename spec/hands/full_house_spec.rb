require 'spec_helper'

module PokerRank
  describe FullHouse do
    context 'with valid data' do
      let(:three_of_kind) {
        ThreeOfKind.new([
                            Card.new('2', :D),
                            Card.new('2', :H),
                            Card.new('2', :S)
                        ])
      }

      let(:pair) {
        Pair.new([
                     Card.new('3', :D),
                     Card.new('3', :H)
                 ])
      }

      it 'it has valid constructor' do
        expect do
          FullHouse.new three_of_kind, pair
        end.not_to raise_error
      end

      it 'has valid rank' do
        full_house = FullHouse.new three_of_kind, pair
        expect(full_house.rank).to be == three_of_kind.rank
      end

      it 'detect itself correctly' do
        cards = three_of_kind.cards + pair.cards
        expect{FullHouse.new_from_hand(cards)}.not_to raise_error
      end
    end

    context 'with invalid data' do
      context 'without pair' do
        it 'not detect itself correctly' do
          cards = [
                Card.new('2', :D),
                Card.new('2', :H),
                Card.new('2', :S),
                Card.new('3', :S),
                Card.new('4', :S)
            ]
          expect{FullHouse.new_from_hand(cards)}.to raise_error
        end
      end

      context 'without three of kind' do
        it 'not detect itself correctly' do
          cards = [
              Card.new('2', :D),
              Card.new('2', :H),
              Card.new('5', :S),
              Card.new('4', :S),
              Card.new('4', :S)
          ]
          expect{FullHouse.new_from_hand(cards)}.to raise_error
        end
      end
    end
  end
end
