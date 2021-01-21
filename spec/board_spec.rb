require './spec/spec_helper'
require 'board'
require 'rspec'

describe Board do
  describe '#initialize' do
    context 'gets a size and outputs an array' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#print_board' do
    context 'to output board layout' do
      it { is_expected.not_to be_nil }
    end
  end

  describe '#update_board' do
    context 'to add new tokens to board' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#validate_board' do
    context 'to output board layout' do
      it { is_expected.not_to be_nil }
    end
  end

  describe '#win?' do
    context 'to check winning move' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#board_full?' do
    context 'to check if the board is full' do
      it { is_expected.not_to be_nil }
    end
  end
end
