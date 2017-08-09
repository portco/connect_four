module ConnectFour
  class Board
    attr_reader :result
    attr_accessor :move, :board_grid, :current_player, :total_moves

    def play
      @board_grid = board_grid
      @current_player = current_player
      @total_moves = total_moves
      @result = update
      render
    end

    def connect_four?
      # evaluate if the board has a connect-four state
      unless current_player.nil?
        return false if move.nil?
        vertical_win? || horizontal_win? || left_diagonal_win? || right_diagonal_win?
      else
        false
      end
    end

    def full?
      # evaluate if the board is full
      if total_moves == board_grid.length * board_grid[0].length
        puts 'The board is full - The game is a tie'
        return true
      end
      false
    end

    private

    def render
      puts "[board] updated with move: #{move}" if @result
      puts

      # Build the grid
      (0..board_grid.length-1).each do |row|
        updated_board = board_grid[row].map { | column | column == '.' ? '0 ' : "#{column} " }
        puts updated_board.join
      end
      puts
    end

    def update
      # update the board's state based on the player's moee
      (0..board_grid.length-1).reverse_each do | row |
        if board_grid[row][move.to_i-1] == '.'
          board_grid[row][move.to_i-1] = current_player.number
          current_player.position = [row, move.to_i-1]
          return true
        end
      end

      puts 'This column is full. Please place it again'
      false
    end

    # vertical win check
    # check the input location (row) to bottom
    # @return Boolean
    def vertical_win?
      return false if total_moves < 7 # minimal count check
      column_counter = 1
      (current_player.position[0]+1..board_grid.length-1).each do | i |
        if board_grid[i][move.to_i-1].to_i == current_player.number.to_i
          column_counter += 1
          if column_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        end
      end
      false
    end

    # horizontal win check
    # 1. check left side until count == 4 from the current move position
    #    if count < 4 then do #2
    # 2. check right side until count == 4 from the current move position
    #    count value does not reset with left side check
    # @return Boolean
    def horizontal_win?
      return false if total_moves < 7 # minimal count check
      row_counter = 1

      # Step 1
      start_point = current_player.position[1]
      (0..start_point-1).reverse_each do | i |
        if board_grid[current_player.position[0]][i].to_i == current_player.number.to_i
          row_counter += 1
          if row_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end

      # Step 2
      (start_point+1..board_grid[0].length-1).each do | i |
        if board_grid[current_player.position[0]][i].to_i == current_player.number.to_i
          row_counter += 1
          if row_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end
      false
    end

    # diagonal win check
    # 1. check left up diagonally until count == 4 from the current move position
    #    if count < 4 then do #2
    # 2. check right down diagonally until count == 4 from the current move position
    #    count value does not reset with left side check
    # @return Boolean
    def left_diagonal_win?
      return false if total_moves < 11 # minimal count check
      left_diagnal_counter = 1
      start_point = current_player.position[1]

      # Step 1
      (0..start_point-1).reverse_each.with_index do | i, loop_count |
        next_column = current_player.position[0]-loop_count-1
        break if board_grid[next_column].nil?
        break if board_grid[i].nil?

        if board_grid[next_column][i].to_i == current_player.number.to_i
          left_diagnal_counter += 1
          if left_diagnal_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end

      # Step 2
      (start_point..board_grid[0].length).each_with_index do | i, loop_count |
        next_column = current_player.position[0]+loop_count+1
        next_row = i+1
        break if board_grid[next_column].nil?
        break if board_grid[next_row].nil?
        if board_grid[next_column][next_row].to_i == current_player.number.to_i
          left_diagnal_counter += 1
          if left_diagnal_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end
      false
    end


    # 1. check right up diagonally until count == 4 from the current move position
    #    if count < 4 then do #2
    # 2. check right down diagonally until count == 4 from the current move position
    #    count value does not reset with left side check
    # @return Boolean
    def right_diagonal_win?
      return false if total_moves < 11 # minimal count check
      right_diagnal_counter = 1
      start_point = current_player.position[1]

      # Step 1
      (start_point+1..board_grid[0].length).each_with_index do | i, loop_count |
        next_column = current_player.position[0]-loop_count-1
        break if board_grid[next_column].nil?
        break if board_grid[i].nil?

        if board_grid[next_column][i].to_i == current_player.number.to_i
          right_diagnal_counter += 1
          if right_diagnal_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end

      # Step 2
      (0..start_point-1).reverse_each.with_index do | i, loop_count |
        next_column = current_player.position[0]+loop_count+1
        break if board_grid[next_column].nil?
        break if board_grid[i].nil?

        if board_grid[next_column][i].to_i == current_player.number.to_i
          right_diagnal_counter += 1
          if right_diagnal_counter == 4
            puts " Player : #{current_player.name} won the game!"
            return true
          end
        else
          break
        end
      end
      false
    end
  end
end
