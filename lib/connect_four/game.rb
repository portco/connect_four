module ConnectFour
  class Game
    def initialize(players)
      @board   = Board.new
      @players = players.each_with_index.map { |name, index| Player.new(name, index+1) }
      @current_player_index = 0
      @columns = 7  # set the width
      @row = 6      # set the height
      @board_grid = Array.new(@row) { Array.new(@columns, '.') } # set the board
      @board.board_grid = @board_grid
    end

    def launch
      welcome
      play until done?
      summarize
    end

    private

    attr_reader :abort, :board, :players, :current_player_index, :board_grid

    def play
      # reset current_player & move
      @board.current_player = current_player
      move = current_player.move
      return if disallow_input?(move)
      @board.move = move

      board.play
      if @board.result
        assign_next_player
        @board.total_moves = @board.total_moves.nil? ? 1 : @board.total_moves + 1
      end
    rescue Interrupt
      @abort = true
    end

    def welcome
      puts "[Connect Four] #{players.map(&:name).join(' (1) vs ')} (2)"
      puts 'Ctrl-C to abort.'
      puts
    end

    def summarize
      # announce if game ends in a tie, otherwise the name of the winner.
      puts
      puts '[Connect Four] game has ended.' unless aborted?
    end

    def current_player
      players[current_player_index]
    end

    def assign_next_player
      # locate the next current player
      @current_player_index = (@current_player_index + 1) % players.count
    end

    def done?
      # check if game play is complete (ie: a player won or the boad is full)
      board.connect_four? || board.full? || aborted?
    end

    def aborted?
      !!abort
    end

    # check two conditions:
    # 1. input is Interger
    # 2. input is in the range
    def disallow_input?(move)
      unless move.is_a?(Integer)
        puts "Invalid input. Use integer (1 - #{@columns + 1}) only\n\n"
        @board.move = nil
        return true
      end
      if move.to_i > @columns.to_i
        puts "Invalid input. Use integer (1 - #{@columns + 1}) only\n\n"
        @board.move = nil
        return true
      end
      false
    end
  end
end
