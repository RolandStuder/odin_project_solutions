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
      expect(player.wins).to eq 1
      expect(player.wins).to eq 2
      expect(player.win_count).to eq 2
    end
  end

  describe :looses do
    it "increments loss count by one" do
      expect(player.loses).to eq 1
      expect(player.loses).to eq 2
      expect(player.loss_count).to eq 2
    end
  end

  describe :statistics do
    it "returns hash with wins losses and percentage" do
      expect(player.statistics).to include(wins: 2)
      expect(player.statistics).to include(losses: 2)
      expect(player.statistics).to include(win_percentage: 0.5)
    end
  end 

  describe :prompt_for_action do
    pending
  end
end

