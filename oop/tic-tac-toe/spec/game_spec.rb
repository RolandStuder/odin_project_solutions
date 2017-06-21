require './lib/player.rb'
require './lib/game.rb'

describe Game do
  players = [Player.new('One'),Player.new('Two')]
  game = Game.new(players)
  
  describe :new do
    it "has two players" do
      expect(game.first_player.tile).to be :x
      expect(game.second_player.tile).to be :o
    end
  end
end