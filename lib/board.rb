class Board

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def cells=(cells)
    @cells = cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell)
    @cells[cell.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    @cells.select{|spot| spot != " " && spot != ""}.length()
  end

  def taken?(position)
    @cells[position.to_i-1] == "O" || @cells[position.to_i-1] == "X"
  end

  def valid_move?(position)
    if position.to_i > 0 && position.to_i < 10
      @cells[position.to_i-1] == " "
    else
      false
    end
  end


  def update(input, player)
    @cells[input.to_i-1] = player.token
  end

end
