require 'spec_helper'

RSpec.describe ConnectFour::Game do

  before :each do
    players = [ConnectFour::Player.new('Alice', 1, [1, 4]), ConnectFour::Player.new('Bob', 1, [1, 4])]
    @obj = ConnectFour::Game.new(players)
  end

  it 'should return false disallow input check' do
    @obj.instance_variable_set(:@columns, 7)
    expect(@obj.send(:disallow_input?, 6)).to eq(false)
  end

  it 'should return true disallow input check' do
    @obj.instance_variable_set(:@columns, 7)
    expect(@obj.send(:disallow_input?, 8)).to eq(true)
  end

  it 'should return true disallow input check' do
    @obj.instance_variable_set(:@columns, 7)
    expect(@obj.send(:disallow_input?, 'bogus')).to eq(true)
  end

end
