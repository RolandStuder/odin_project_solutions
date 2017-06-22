require './lib/board.rb'
require 'pry'

describe 'Board' do
  board = Board.new
  code = [1,2,3,4]

  describe 'code' do
    it 'accepts setting a code' do
      board.set_code(code)
      expect(board.code).to eq [1,2,3,4]
    end

    it 'denies invalid codes' do
      expect( board.set_code([0,7,8,9]) ).to eq false
    end
  end


  describe 'break_attempt' do
    it 'returns false for invalid input' do
      expect(board.break_attempt([1,8,9])).to eq false
      expect(board.break_attempt([1,1,1,1,1])).to eq false
      expect(board.break_attempt([1,1,1,9])).to eq false
    end

    it 'returns no matches if there are no matches  ' do
      expect(board.break_attempt([5,5,5,5])).to include ({correct_positions: 0, correct_colors: 0})
      expect(board.break_attempt([6,6,6,6])).to include ({correct_positions: 0, correct_colors: 0})
    end

    it 'matches positions' do
      expect(board.break_attempt([1,5,5,5])).to include ({correct_positions: 1})
      expect(board.break_attempt([1,2,5,5])).to include ({correct_positions: 2})
      expect(board.break_attempt([1,2,5,4])).to include ({correct_positions: 3})
      expect(board.break_attempt([1,2,3,4])).to include ({correct_positions: 4})
    end

    it 'matches colors' do
      expect(board.break_attempt([5,5,5,1])).to include ({correct_colors: 1, correct_positions: 0})
      expect(board.break_attempt([5,1,2,5])).to include ({correct_colors: 2, correct_positions: 0})
      expect(board.break_attempt([4,1,2,3])).to include ({correct_colors: 4, correct_positions: 0})
    end


    it 'matches colors and positions' do
      expect(board.break_attempt([1,4,3,2])).to include ({correct_colors: 2, correct_positions: 2})
      expect(board.break_attempt([1,3,4,2])).to include ({correct_colors: 3, correct_positions: 1})
    end

    it 'does not return more hints, than matched pegs' do 
      expect(board.break_attempt([1,1,1,1])).to include ({correct_colors: 0, correct_positions: 1})
      expect(board.break_attempt([5,1,1,1])).to include ({correct_colors: 1, correct_positions: 0})
      expect(board.break_attempt([1,1,2,2])).to include ({correct_colors: 1, correct_positions: 1})
    end

    it 'doesn t overmatch pegs' do
      board2 = Board.new
      board2.set_code([1,1,1,2])

      expect(board2.break_attempt([1,1,1,1])).to include ({correct_colors: 0, correct_positions: 3})
      expect(board2.break_attempt([5,1,1,1])).to include ({correct_colors: 1, correct_positions: 2})
      expect(board2.break_attempt([1,1,2,2])).to include ({correct_colors: 0, correct_positions: 3})
      expect(board2.break_attempt([2,2,2,5])).to include ({correct_colors: 1, correct_positions: 0})

      board3 = Board.new
      board3.set_code([3,4,5,4])

      expect(board3.break_attempt([3,5,4,5])).to include ({correct_colors: 2, correct_positions: 1})

      board4 = Board.new
      board4.set_code([2,1,2,4])

      expect(board4.break_attempt([1,2,3,4])).to include ({correct_colors: 2, correct_positions: 1})
    end
  end

  describe 'code_broken?' do
    it 'finds broken code' do
      board.break_attempt([code])
      expect(board.code_broken?).to be true
    end

    it 'returns false if not' do
      board = Board.new
      expect(board.code_broken?).to be false
    end
  end

  describe 'all_attempts_used?' do
    it 'returns false on less than 12 attempts' do
      board = Board.new
      6.times { board.break_attempt([1,2,3,4]) }
      expect(board.all_attempts_used?).to be false
    end

    it 'true false on less on 12 attempts' do
      board = Board.new
      12.times { board.break_attempt([1,2,3,4]) }
      expect(board.all_attempts_used?).to be true
    end
  end
end