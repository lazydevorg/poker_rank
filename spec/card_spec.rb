require 'spec_helper'

describe Card do
  context 'valid data' do
    it 'has valid constructor' do
      expect{Card.new '2', :S}.to_not raise_error
    end

    it 'has correct string representation' do
      expect(Card.new('8', :C).to_s).to be == '8C'
    end

    it 'returns correct rank' do
      expect(Card.new('5', :D).rank).to be == 5
      expect(Card.new('T', :H).rank).to be == 10
      expect(Card.new('A', :S).rank).to be == 14
    end
  end

  context 'not valid data' do
    it 'not accept invalid suit' do
      expect{Card.new '2', :A}.to raise_error Card::NotValidSuitError
    end

    it 'not accept invalid value' do
      expect{Card.new 'Z', :H}.to raise_error Card::NotValidValueError
    end
  end
end