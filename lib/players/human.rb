
module Players
  class Human < Player

    def move(board)
      puts "What would you like to do, Player #{self.token}?"
      choice = gets.chomp
      system "clear"
      @board.display
      puts "The human chose #{choice}. Interesting..."
      choice
    end

  end
end
