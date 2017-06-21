require './lib/board.rb'


describe Board do
  board = Board.new

  describe :put do
    it "puts tiles in legal locations" do
      board.put(:x, 1, 1)
      expect(board.tiles[1][1]).to be :x
      board.put(:o, 1, 2)
      expect(board.tiles[1][2]).to be :o
    end

    it "returns false for illegal locations" do
      expect(board.put(:x, 1, 1)).to be false
      expect(board.put(:x, 4, 4)).to be false
    end

    it "draws board" do
      board.draw
    end
  end
end