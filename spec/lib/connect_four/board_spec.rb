require 'spec_helper'

RSpec.describe ConnectFour::Board do

  before :each do
    @obj = ConnectFour::Board.new
  end

  context 'vertical_win? checking' do
    it 'should return false with check vertical win due to minimal input' do
      @obj.instance_variable_set(:@total_moves, 6)
      expect(@obj.send(:vertical_win?)).to eq(false)
    end

    it 'should return true with vertical win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [2, 4])
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 5)

      expect(@obj.send(:vertical_win?)).to eq(true)
    end

    it 'should return true with vertical win check with different board setting' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '1', '.', '2', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [1, 4])
      @obj.instance_variable_set(:@total_moves, 9)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 5)

      expect(@obj.send(:vertical_win?)).to eq(true)
    end

    it 'should return false with vertical win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.'],
          ['.', '.', '.', '2', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [2, 3])
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 4)

      expect(@obj.send(:vertical_win?)).to eq(false)
    end
  end

  context 'horizontal_win? checking' do
    it 'should return false with check horizontal win due to minimal input' do
      @obj.instance_variable_set(:@total_moves, 6)
      expect(@obj.send(:horizontal_win?)).to eq(false)
    end

    it 'should return true with horizontal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '2', '2', '2', '.'],
          ['.', '.', '1', '1', '1', '1', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [5, 2])
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 3)

      expect(@obj.send(:horizontal_win?)).to eq(true)
    end

    it 'should return true with vertical win check with different board setting' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '2', '.', '2', '2', '.', '.'],
          ['.', '1', '1', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [5, 2])
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 3)

      expect(@obj.send(:horizontal_win?)).to eq(true)
    end

    it 'should return true with vertical win check with different board setting' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '2', '.', '2', '2', '.', '.'],
          ['.', '1', '.', '1', '1', '1', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [5, 5])
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 6)

      expect(@obj.send(:horizontal_win?)).to eq(false)
    end
  end

  context 'left_diagonal_win? checking' do
    it 'should return false with check left diagonal win due to minimal input' do
      @obj.instance_variable_set(:@total_moves, 10)
      expect(@obj.send(:left_diagonal_win?)).to eq(false)
    end

    it 'should return true with left diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['1', '.', '.', '.', '.', '.', '.'],
          ['2', '1', '.', '.', '.', '.', '.'],
          ['2', '1', '1', '.', '.', '.', '.'],
          ['2', '2', '2', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [2, 0])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 1)

      expect(@obj.send(:left_diagonal_win?)).to eq(true)
    end

    it 'should return true with left diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['1', '.', '.', '.', '.', '.', '.'],
          ['2', '1', '.', '.', '.', '.', '.'],
          ['2', '1', '1', '.', '.', '.', '.'],
          ['2', '2', '2', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [5, 3])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 4)

      expect(@obj.send(:left_diagonal_win?)).to eq(true)
    end

    it 'should return true with left diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['1', '.', '.', '.', '.', '.', '.'],
          ['2', '1', '.', '.', '.', '.', '.'],
          ['2', '1', '1', '.', '.', '.', '.'],
          ['2', '2', '2', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [4, 2])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 3)

      expect(@obj.send(:left_diagonal_win?)).to eq(true)
    end

    it 'should return false with left diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['2', '.', '.', '.', '.', '.', '.'],
          ['1', '1', '.', '.', '.', '.', '.'],
          ['2', '1', '1', '.', '.', '.', '.'],
          ['2', '2', '2', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [3, 1])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 2)

      expect(@obj.send(:left_diagonal_win?)).to eq(false)
    end

    it 'should return false with left diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['2', '.', '.', '.', '.', '.', '.'],
          ['1', '1', '.', '.', '.', '.', '.'],
          ['2', '1', '1', '.', '.', '.', '.'],
          ['2', '2', '2', '1', '1', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [4, 2])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 3)

      expect(@obj.send(:left_diagonal_win?)).to eq(false)
    end
  end

  context 'right_diagonal_win? checking' do
    it 'should return false with check right diagonal win due to minimal input' do
      @obj.instance_variable_set(:@total_moves, 10)
      expect(@obj.send(:right_diagonal_win?)).to eq(false)
    end

    it 'should return true with right diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '1', '2', '.', '.'],
          ['.', '2', '1', '1', '1', '.', '.'],
          ['.', '1', '2', '2', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [2, 4])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 5)

      expect(@obj.send(:right_diagonal_win?)).to eq(true)
    end

    it 'should return true with right diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '1', '2', '.', '.'],
          ['.', '2', '1', '1', '1', '.', '.'],
          ['.', '1', '2', '2', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [4, 2])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 3)

      expect(@obj.send(:right_diagonal_win?)).to eq(true)
    end

    it 'should return false with right diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '1', '.', '.'],
          ['.', '.', '.', '1', '1', '.', '.'],
          ['.', '2', '1', '1', '2', '.', '.'],
          ['.', '2', '1', '2', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [4, 2])
      obj = ConnectFour::Board.new
      obj.instance_variable_set(:@total_moves, 11)
      obj.instance_variable_set(:@board_grid, grid)
      obj.instance_variable_set(:@current_player, player)
      obj.instance_variable_set(:@move, 3)

      expect(obj.send(:right_diagonal_win?)).to eq(false)
    end

    it 'should return false with right diagonal win check' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '2', '.', '.'],
          ['.', '.', '.', '1', '1', '.', '.'],
          ['.', '2', '1', '1', '2', '.', '.'],
          ['.', '1', '1', '2', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [3, 3])
      @obj.instance_variable_set(:@total_moves, 11)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 4)

      expect(@obj.send(:right_diagonal_win?)).to eq(false)
    end

    it 'should return false with right diagonal win check' do
      grid = [
          ['.', '.', '.', '2', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.'],
          ['.', '.', '.', '2', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.'],
          ['.', '.', '1', '2', '.', '.', '.'],
          ['2', '1', '1', '1', '2', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1, [4, 2])
      obj = ConnectFour::Board.new
      obj.instance_variable_set(:@total_moves, 11)
      obj.instance_variable_set(:@board_grid, grid)
      obj.instance_variable_set(:@current_player, player)
      obj.instance_variable_set(:@move, 3)

      expect(obj.send(:right_diagonal_win?)).to eq(false)
    end
  end

  context 'full? checking' do
    it 'should return true with board full check' do
      grid = [
          ['2', '2', '1', '2', '2', '1', '2'],
          ['2', '2', '2', '1', '1', '1', '1'],
          ['1', '1', '1', '2', '2', '1', '2'],
          ['1', '2', '1', '1', '2', '2', '1'],
          ['1', '2', '1', '1', '1', '1', '2'],
          ['2', '1', '2', '1', '2', '2', '1']
      ]
      player = ConnectFour::Player.new('Alice', 1, [0, 5])
      @obj.instance_variable_set(:@total_moves, 42)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 5)

      expect(@obj.send(:full?)).to eq(true)
    end
  end

  context 'update' do
    it 'should true with updated board' do
      grid = [
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '.', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1)
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 4)

      expect(@obj.send(:update)).to eq(true)
    end

    it 'should false with the error message' do
      grid = [
          ['.', '.', '.', '2', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.'],
          ['.', '.', '.', '2', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.'],
          ['.', '.', '.', '2', '.', '.', '.'],
          ['.', '.', '.', '1', '.', '.', '.']
      ]
      player = ConnectFour::Player.new('Alice', 1)
      @obj.instance_variable_set(:@total_moves, 7)
      @obj.instance_variable_set(:@board_grid, grid)
      @obj.instance_variable_set(:@current_player, player)
      @obj.instance_variable_set(:@move, 4)

      expect(@obj.send(:update)).to eq(false)
    end
  end

end
