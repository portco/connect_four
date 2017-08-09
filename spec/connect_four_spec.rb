require 'spec_helper'

RSpec.describe ConnectFour do
  it 'has a version number' do
    expect(ConnectFour::VERSION).not_to be nil
  end

  it 'Make sure main module - ConnectFour loads all modules' do
    players = ['Alice', 'Bob']
    expect(ConnectFour::Game.new(players)).not_to be_nil
    expect(ConnectFour::Board.new).not_to be_nil
    expect(ConnectFour::Player.new(players[0], 1)).not_to be_nil
  end
end
