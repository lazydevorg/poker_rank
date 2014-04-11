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
                   Card.new('2', :D),
                   Card.new('2', :H)
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
  end
end