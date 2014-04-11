describe Straight do
  context 'with valid data' do
    let(:cards) {
      [
          Card.new('2', :D),
          Card.new('3', :D),
          Card.new('4', :D),
          Card.new('5', :D),
          Card.new('6', :D)
      ]
    }

    it 'accept valid strength' do
      expect{Straight.new(cards)}.not_to raise_error
    end

    it 'has valid rank' do
      expect(Straight.new(cards).rank).to be == 6
    end
  end

  context 'with invalid data' do
    it 'accept only five cards' do
      cards = [
          Card.new('2', :D),
          Card.new('3', :D),
          Card.new('4', :D),
          Card.new('5', :D)
      ]
      expect{Straight.new(cards)}.to raise_error
    end
  end
end