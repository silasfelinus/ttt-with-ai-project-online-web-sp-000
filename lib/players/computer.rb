
module Players
  class Computer < Player

    def move(board)
      #Can I win?
      choice = if optimal_move(board, self.token)
        optimal_move(board, self.token)
      elsif optimal_move(board, self.opponent_token)
        optimal_move(board, self.opponent_token)
      elsif board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      else "8"
      end
      system "clear"
      @board.display
      puts "In my infinite wisdom, I choose to go to #{choice}"
      choice

    end



    def optimal_move(board, token)
      #returns a moveset that is one piece away from victory"
      choice = Game::WIN_COMBINATIONS.select {|combo|
        board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " " ||
        board.cells[combo[0]] == token && board.cells[combo[1]] == " " && board.cells[combo[2]] == token ||
        board.cells[combo[0]] == " " && board.cells[combo[1]] == token && board.cells[combo[2]] == token}
      if choice != []
        binding.pry
        choice[0].select {|position| board.cells[position] == " "}[0]
      end
    end
  end
end
