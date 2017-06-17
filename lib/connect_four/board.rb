module ConnectFour
  class Board
    def play(player)
      request player.turn until valid?
      update_states
    end

    def request(turn)
      # use the player's latest turn against the board's state
      @latest_turn = turn.to_i
    end

    def connect_four?
      # evaluate if the board has a connect-four state
      false
    end

    def full?
      # evaluate if the board is full
      false
    end

    def render
      # render the board's state
    end

    private

    attr_reader :latest_turn

    def update_states
      # update the board's state based on the player's latest turn
      # and clear the latest turn
      @latest_turn = nil
    end

    def valid?
      # validate the player's latest turn
      latest_turn && latest_turn.even?
    end
  end
end
