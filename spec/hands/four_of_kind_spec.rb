describe FourOfKind do
  context 'with valid data' do
    let(:cards) {
      [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S),
          Card.new('2', :C)
      ]
    }

    it 'accept valid cards' do
      expect{FourOfKind.new(cards)}.not_to raise_error
    end

    it 'has valid rank' do
      expect(FourOfKind.new(cards).rank).to be == 8
    end
  end

  context 'with invalid data' do
    it 'accept only four cards' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S)
      ]
      expect{FourOfKind.new(cards)}.to raise_error
    end

    it 'accept only same value' do
      cards = [
          Card.new('2', :D),
          Card.new('2', :H),
          Card.new('2', :S),
          Card.new('3', :C)
      ]
      expect{FourOfKind.new(cards)}.to raise_error
    end
  end
end