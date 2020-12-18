class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6], # First column
  [1,4,7],  # Middle column
  [2,5,8],  # last column
  [0,4,8], # backslash diagonal
  [2,4,6]  # forwardslash diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    case @board.cells.select {|position| position == "X" || position == "O"}.length() % 2
    when 0
      @player_1
    when 1
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.select {|combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo [2]] && @board.cells[combo[1]] != " "}[0]
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    else nil
    end
  end

  def turn
    index = current_player.move(@board)
    if @board.valid_move?(index)
      @board.update(index, current_player)
      @board.display
    else
      puts "That move is invalid!"
      turn
    end
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner()}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
