
require_relative '../lib/board'
require_relative '../lib/player'

# def left_symbol(symbol)
#   symbol == 'X' ? 'O' : 'X'
# end

def get_row(pos)
  %w[A B C].index(pos[0])
end

def get_col(pos)
  %w[1 2 3].index(pos[1])
end

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

def valid_position?(pos)
  pos.length == 2 && ('ABC'.include?(pos[0]) && '123'.include?(pos[1]))
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

def position_occupied(board, row, col)
  return false if board.validate(row, col)

  puts 'Position already Taken'
  true
end

def draw(board)
  if board.board_full?
    puts '-----Game Draw------'
    return true
  end
  false
end

def won(board, player)
  if board.win?(player.symbol)
    puts "#{player.name} WON !!!!"
    return true
  end
  false
end


puts '-----Tic Tac Toe--------'

name1 = player_name(1)
name2 = player_name(2)
name2 = name1 == name2 ? "#{name2}-1" : name2

puts "Welcome #{name1} and #{name2}."

s1 = player_symbol(name1)
s2 = player_symbol(name2)
s2 = s1 == s2 ? select_different_token(name2, s2) : s2

puts "#{name1} your symbol is #{s1}"
puts "#{name2} your symbol is #{s2}"

p1 = Player.new(name1, s1)
p2 = Player.new(name2, s2)

puts '-------Game Started-----------'

board = Board.new
puts board.print_board
active_player = p1

loop do
  pos = position(active_player.name)
  row = get_row(pos)
  col = get_col(pos)

  next if position_occupied(board, row, col)

  board.update_board(row, col, active_player.symbol)
  puts board.print_board

  break if won(board, active_player) || draw(board)

  active_player = active_player == p1 ? p2 : p1
end
