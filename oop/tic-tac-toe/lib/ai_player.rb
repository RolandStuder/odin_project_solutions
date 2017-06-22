require 'pry'

class AIPlayer < Player
  def initialize(name, strategy = nil)
    super
    @moves = []
    @winning_sequences = []
    @strategy = strategy
  end

  def prompt_for_action(moves)
    @moves = moves 
    
    # return random_available_move if @moves.length == 0
      
    case @strategy
    when :both
      avoid_loosing || winning_strategy || random_available_move
    when :winning
      winning_strategy || random_available_move
    when :avoid_loosing
      avoid_loosing || random_available_move
    else
      random_available_move
    end
  end

  def winning_strategy
    my_winning_sequences = @winning_sequences.select do |seq| 
      (@moves - seq).empty? && next_move_available?(seq) && winning_for_me?(seq)
    end
    my_winning_sequences.empty? ? nil : my_winning_sequences.sample[@moves.length][0]
  end

  def wins(moves)
    super
    @winning_sequences << moves
  end

  def loses(moves)
    super
    @winning_sequences << moves
  end

  def avoid_loosing
    my_losing_sequences = @winning_sequences.select do |seq|
      (@moves - seq).empty? && next_move_available?(seq) && winning_for_oppenent?(seq)
    end

    my_losing_moves = my_losing_sequences.map { |seq| seq[@moves.length][0] }
    good_moves = available_moves - my_losing_moves
    good_moves.empty? ? nil : good_moves.sample
  end

  def next_move_available?(seq)
    !@moves.include?(seq[@moves.length])
  end

  def winning_for_me?(seq)
    seq.last[1] == @tile
  end

  def winning_for_oppenent?(seq)
    seq.last[1] != @tile
  end


  def available_moves
    occupied = @moves.map { |move| move[0]}
    (1..9).to_a - occupied
  end

  def random_available_move
    available_moves.sample
  end
end