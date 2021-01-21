require './spec/spec_helper'
require 'board'
require 'rspec'

describe Board do
  describe '#initialize' do
    context 'when a size is given outputs an array' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#print_board' do
    context 'when called it return board array' do
      it { is_expected.not_to be_nil }
    end
  end

  describe '#update_board' do
    context 'when updated with a token' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#validate_board' do
    context 'when called' do
      it { is_expected.not_to be_nil }
    end
  end

  describe '#win?' do
    context 'when moves are aligned correctly' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#board_full?' do
    context 'when board ia fully occupied' do
      it { is_expected.not_to be_nil }
    end
  end
end
