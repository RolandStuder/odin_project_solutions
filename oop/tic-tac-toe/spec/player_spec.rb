require './lib/player.rb'

describe Player do
  
  player = Player.new("Roland")

  describe :new do
    it "initiates new player with name" do
      player = Player.new("Roland")
      expect(player.name).to eq "Roland" 
    end
  end

  describe :wins do
    it "increments win count by one" do
      player.wins(@moves)
      player.wins(@moves)
      expect(player.statistics[:wins]).to eq 2
    end
  end

  describe :looses do
    it "increments loss count by one" do
      player.loses(@moves)
      player.loses(@moves)
      expect(player.statistics[:losses]).to eq 2
    end
  end

  describe :prompt_for_action do
    pending
  end
end

