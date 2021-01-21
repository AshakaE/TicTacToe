require './spec/spec_helper'
require 'player'
require 'rspec'

describe Player do
  let(:ashaka) { Player.new('Ashaka', 'O') }
  describe '#initialize' do
    it 'takes a name and assigns a symbol' do
      expect(ashaka.name).to eq('Ashaka')
      expect(ashaka.symbol).to eq('O')
    end
  end
end
