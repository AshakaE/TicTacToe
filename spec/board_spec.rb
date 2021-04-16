require 'spec_helper'
require 'board'
require 'rspec'

describe Board do
  describe '#initialize' do
    it 'should set the size of the board' do
      result = Board.new
      expect(result.instance_variable_get(:@size)).to eq(3)
    end

    it 'should set the board as an empty array' do
      result = Board.new
      expect(result.instance_variable_get(:@data)).to eq([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#print_board' do
    it 'outputs the board' do
      board = Board.new
      result = board.print_board
      expect(result).not_to be_nil
    end
  end

  describe '#validate?' do
    it 'checks a valid move' do
      board = Board.new
      row = 1
      col = 2
      result = board.validate?(row, col)
      expect(result).to be_truthy
    end
  end

  describe '#win?' do
    it 'compares winning moves' do
      board = Board.new
      sym = double('sym')
      result = board.win?(sym)
      expect(result).not_to be_nil
    end
  end

  describe '#board_full?' do
    it 'checks if there is not empty space in the array' do
      board = Board.new
      result = board.board_full?
      expect(result).not_to be_nil
    end
  end
end
