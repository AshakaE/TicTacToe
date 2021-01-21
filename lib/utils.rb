class Utils
  private

  def valid_position?(pos)
    pos.length == 2 && ('ABC'.include?(pos[0]) && '123'.include?(pos[1]))
  end

  def get_row(pos)
    %w[A B C].index(pos[0])
  end

  def get_col(pos)
    %w[1 2 3].index(pos[1])
  end

  def user_info
    name1 = player_name(1)
    name2 = player_name(2)
    name2 = name1 == name2 ? "#{name2}-1" : name2

    s1 = player_symbol(name1)
    s2 = player_symbol(name2)
    s2 = s1 == s2 ? select_different_token(name2, s2) : s2

    [name1, s1, name2, s2]
  end
end
