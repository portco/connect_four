module ConnectFour
  class Game
    def initialize(players)
      @board   = Board.new
      @players = players.map { |name| Player.new(name) }
      @current_player_index = 0
    end

    def launch
      welcome

      loop do
        board.play current_player
        board.render

        break if complete?
        switch_player
        puts
      end

      summarize
    end

    private

    attr_reader :board, :players, :current_player_index

    def welcome
      puts "[ConnectFour] #{players.map(&:name).join(' vs ')}"
      puts
    end

    def summarize
      if board.connect_four?
        puts "#{current_player.name} wins!"
      else
        puts 'The game is a tie.'
      end
    end

    def current_player
      players[current_player_index]
    end

    def switch_player
      @current_player_index = (@current_player_index + 1) % players.count
    end

    def complete?
      board.connect_four? || board.full?
    end
  end
end
