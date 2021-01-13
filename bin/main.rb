#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'

def left_symbol(symbol)
  symbol == 'X' ? 'O' : 'X'
end

def get_row(pos)
  %w[A B C].index(pos[0])
end

def get_col(pos)
  %w[1 2 3].index(pos[1])
end

puts '-----Tic Tac Toe--------'

puts 'Player-1 Enter your name:'
name1 = gets.chomp.capitalize
puts 'Player-2 Enter Your Name:'
name2 = gets.chomp.capitalize

puts "Welcome #{name1} and #{name2}."

puts "#{name1} please select your symbol [X or O]:"
s1 = gets.chomp.upcase
s2 = left_symbol(s1)
puts "#{name1} your symbol is #{s1}"
puts "#{name2} your symbol is #{s2}"

p1 = Player.new(name1, s1)
p2 = Player.new(name2, s2)

puts '-------Game Started-----------'

board = Board.new
board.print_board
active_player = p1

loop do
  puts "#{active_player.name} Move: Enter Position[Example: A2]"
  pos = gets.chomp.upcase
  row = get_row(pos)
  col = get_col(pos)

  unless board.validate(row, col)
    puts 'Invalid Position'
    next
  end

  board.update_board(row, col, active_player.symbol)
  board.print_board

  if board_full?
    puts '----Game Draw-----'
    break
  end

  if board.win?(active_player.symbol)
    puts "#{active_player.name} WON !!!!"
    break
  end

  active_player = active_player == p1 ? p2 : p1
end
