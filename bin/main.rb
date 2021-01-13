#!/usr/bin/env ruby


def left_symbol(s1)
  s1 == 'X' ? 'O' : 'X'
end

puts '-----Tic Tac Toe--------'

puts 'Player-1 Enter your name:'
name1 = gets.chomp.capitalize
puts 'Plater-2 Enter Your Name:'
name2 = gets.chomp.capitalize

puts "Welcome #{name1} and #{name2}."

puts "#{name1} please select your symbol [X or O]:"
s1 = gets.chomp.upcase
s2 = left_symbol(s1)
puts "#{name1} your symbol is #{s1}"
puts "#{name2} your symbol is #{s2}"




