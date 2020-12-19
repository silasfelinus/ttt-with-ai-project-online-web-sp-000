class Player

  attr_reader :token, :opponent_token

  def initialize(token)
    @token = token
    case @token
    when "X"
      @opponent_token = "O"
    when "O"
      @opponent_token = "X"
    end
  end

end
