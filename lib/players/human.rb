
module Players
  class Human < Player

    def move(board)
      puts "What would you like to do?"
      gets.chomp
    end

  end
end
