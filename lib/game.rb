class Game
  attr_accessor :board, :player_1, :player_2, :outcome

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
    @outcome = "undecided"
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

    else
      system "clear"
      @board.display
      puts "That move is invalid!"
      turn
    end
  end

  def play
    system "clear"
    until over?
      @board.display
      turn
    end

    if winner
      system "clear"
      @board.display
      #current_player is the loser after a winning move
      if current_player.class == Players::Computer && (@player_1.class == Players::Human || @player_2.class == Players::Human )
        puts "A human beat me?!? Inconceivable!"
      elsif @player_1.class == Players::Computer && @player_2.class == Players::Computer
        puts "I'm my own worst enemy!"
      elsif current_player.class == Players::Human && (@player_1.class == Players::Computer || @player_2.class == Players::Computer )
        puts "I won, but then, I am the superior intelligence."
      else
        puts "Congratulations #{winner()}!"
      end
      outcome = (@board.turn_count.to_i % 2) + 1
    end

    if draw?
      system "clear"
      @board.display
      puts "Cat's Game!"
      outcome = "draw"
    end

    outcome
  end

end
