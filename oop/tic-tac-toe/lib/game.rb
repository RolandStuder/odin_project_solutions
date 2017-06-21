require './lib/board'
require 'pry'

class Game
  attr_accessor :first_player, :second_player


  def initialize(players)
    first = [0,1].sample
    second = first == 1 ? 0 : 1
    
    @first_player = players[first]
    @first_player.tile = :x
    @second_player = players[second]
    @second_player.tile = :o

    @current_player = @first_player
    @board = Board.new
    @moves = []
  end

  def start
    puts "#{@first_player.name} begins."
    puts "Pick a number to put your tile:"
    loop do
      turn
      break if win?(@current_player.tile)
      break if draw?
      next_player
    end

    system 'clear'
    @board.draw

    if win?(@current_player.tile)  
      puts "#{@current_player.name} WINS!!!!!!"
      @current_player.wins
      next_player.loses
    else
      puts "It's a draw :-)"
      @current_player.draws
      next_player.draws

    end
  end 

  def turn
    system 'clear'
    @board.draw
    puts "New turn for #{@current_player.name} (#{@board.send(@current_player.tile)})"
    tile = @current_player.prompt_for_action
    x,y = number_to_x_y(tile)
    if @board.put(@current_player.tile,x,y)
      @moves << tile
    else
      turn
    end
  end

  def number_to_x_y number
    int = number.to_i
    case int
    when 1 then return 0,0
    when 2 then return 0,1
    when 3 then return 0,2
    when 4 then return 1,0
    when 5 then return 1,1
    when 6 then return 1,2
    when 7 then return 2,0
    when 8 then return 2,1
    when 9 then return 2,2
    else 
      return false
    end
  end


  def next_player
    @current_player = @current_player == @first_player ? @second_player : @first_player
  end

  def win? (tile)
    win_conditions = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7],
    ]

    all = all_tile_positions(tile)    
    win_conditions.select { |cond| (cond-all).empty? }.count > 0 ? true : false
  end

  def draw?
    @moves.length == 9
  end

  def all_tile_positions(tile)
    res = []
    @board.tiles.flatten.each_with_index{ |current, i| (res << i+1) if current == tile }
    res
  end

end