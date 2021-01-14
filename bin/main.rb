
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/utils'
require_relative '../lib/colors'


def player_name(num)
  print "Player-#{num} Enter your name: "
  name = gets.chomp
  if name.empty?
    puts 'Invalid Name'
    name = player_name(num)
  end

  name.capitalize
end

def player_symbol(name)
  print "#{name} Choose your LUCKY Token: "
  sym = gets.chomp
  if sym.empty? || sym.length > 1
    puts 'Invalid Token. Please enter a single letter'
    sym = player_symbol(name)
  end

  sym.upcase
end

def position(name)
  print "#{name} Move: Enter Position[Example: A2]"
  pos = gets.chomp.upcase
  if valid_position?(pos)
    pos
  else
    puts 'Invalid Position. Try different position'
    position(name)
  end
end

def select_different_token(name, sym)
  puts 'Opponent Token. Try different'
  new_sym = player_symbol(name)
  new_sym == sym ? select_different_token(name, sym) : new_sym
end

def position_occupied?(board, row, col)
  return false if board.validate?(row, col)

  puts 'Position already Taken'

  true
end

def draw?(board)
  if board.board_full?
    puts '-------- 𝔾𝕒𝕞𝕖 𝔻𝕣𝕒𝕨 --------'.red
    return true
  end

  false
end

def won?(board, player)
  if board.win?(player.symbol)
    puts "ℂ𝕠𝕟𝕘𝕣𝕒𝕥𝕦𝕝𝕒𝕥𝕚𝕠𝕟𝕤 ❕ #{player.name} 𝕎𝕆ℕ ❕❕❕".green
    return true
  end

  false
end

puts "\n-------- ̄𝕋𝕚𝕔 𝕋𝕒𝕔 𝕋𝕠𝕖 -------- \n".cyan

name1, s1, name2, s2 = user_info
name1 = name1.blue
s1 = s1.blue
name2 = name2.red
s2 = s2.red

puts "\nWelcome #{name1} and #{name2}\n".bold

puts "#{name1} your Token is #{s1}"
puts "#{name2} your Token is #{s2}"

p1 = Player.new(name1, s1)
p2 = Player.new(name2, s2)

puts "\n-------- 𝔾𝕒𝕞𝕖 𝕊𝕥𝕒𝕣𝕥𝕖𝕕 --------\n\n".cyan

board = Board.new
puts board.print_board
active_player = p1

loop do
  pos = position(active_player.name)
  row = get_row(pos)
  col = get_col(pos)

  next if position_occupied?(board, row, col)

  board.update_board(row, col, active_player.symbol)
  puts board.print_board

  break if won?(board, active_player) || draw?(board)

  active_player = active_player == p1 ? p2 : p1
end
