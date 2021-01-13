class Board
  def initialize
    @size = 3
    @data = Array.new(@size) { Array.new(@size, ' ') }
  end

  def print_board
    puts '   1   2   3'
    puts "A #{row_to_str(@data[0])} "
    puts '  ---+---+---'
    puts "B #{row_to_str(@data[1])} "
    puts '  ---+---+---'
    puts "C #{row_to_str(@data[2])} "
    puts
  end

  def row_to_str(row)
    row.map { |m| " #{m} " }.join('|')
  end

  def update_board(row, col, sym)
    @data[row][col] = sym
  end

end

