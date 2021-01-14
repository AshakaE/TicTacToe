class Board
  def initialize
    @size = 3
    @data = Array.new(@size) { Array.new(@size, ' ') }
  end

  def print_board
    "       𝟙   𝟚   𝟛
    𝔸  #{@data[0].join(' | ')}
      ---+---+---
    𝔹  #{@data[1].join(' | ')}
      ---+---+---
    ℂ  #{@data[2].join(' | ')} \n\n"
  end

  def update_board(row, col, sym)
    @data[row][col] = sym
  end

  def validate?(row, col)
    @data[row][col] == ' '
  end

  def win_row?(sym)
    @data.any? { |e1| e1.all? { |e2| e2 == sym } }
  end

  def win_col?(sym)
    @data.transpose.any? { |e1| e1.all? { |e2| e2 == sym } }
  end

  def win_diagonal?(sym)
    d1 = @data[0][0] == sym && @data[1][1] == sym && @data[2][2] == sym
    d2 = @data[2][0] == sym && @data[1][1] == sym && @data[0][2] == sym
    d1 || d2
  end

  def win?(sym)
    win_row?(sym) || win_col?(sym) || win_diagonal?(sym)
  end

  def board_full?
    @data.flatten.all? { |e| e != ' ' }
  end
end
