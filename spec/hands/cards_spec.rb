describe CardsManager do
  it 'calculate correct rank' do
    cards = CardsManager.new([
          Card.new('2', :H),
          Card.new('5', :S)
      ])
    expect(cards.rank).to be == 7

    cards = CardsManager.new([
          Card.new('T', :H),
          Card.new('K', :S)
      ])
    expect(cards.rank).to be == 23
  end

  it 'detect same suit' do
    cards = CardsManager.new([
          Card.new('2', :H),
          Card.new('5', :H)
      ])
    expect(cards.are_same_suit?).to be_true
  end

  it 'detect not same suit' do
    cards = CardsManager.new([
          Card.new('2', :H),
          Card.new('5', :D)
      ])
    expect(cards.are_same_suit?).to be_false
  end
end