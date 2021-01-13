#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/player'

def left_symbol(symbol)
  symbol == 'X' ? 'O' : 'X'
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


