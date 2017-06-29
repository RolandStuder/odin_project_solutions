require './lib/board.rb'
require './lib/player.rb'
require './lib/ai_player.rb'
require 'pry'


class Main

  def initialize
    @board = Board.new
  end

  def start
    system 'clear'

    @player = Player.new("Human")
    @ai_player = AIPlayer.new

    game_mode = prompt("Chose game mode\n(1) Code Breaker or \n(2) Code Maker\n(3) Simulation").to_i
    
    human_as_code_breaker if game_mode == 1
    human_as_code_maker  if game_mode == 2
    simulation if game_mode == 3
  end

  private

  def human_as_code_breaker
    play(@ai_player,@player)
  end

  def human_as_code_maker
    play(@player,@ai_player)
  end


  def play(maker,breaker)
    code = maker.prompt_for_secret_code
    @board.set_code(code)
    @current_player = breaker
    loop do
      system 'clear'
      @board.draw
      guess = breaker.prompt_for_guess(nil,@board)
      sleep(1) if breaker.class == AIPlayer
      @board.break_attempt(guess)
      win if @board.code_broken?
      loose if @board.all_attempts_used?
    end 
  end

  def simulation
    @player = AIPlayer.new
    solved_in = []

    100.times do 
      code = @player.prompt_for_secret_code
      @board = Board.new
      @board.set_code(code)

      loop do
        guess = @player.prompt_for_guess(nil,@board)
        @board.break_attempt(guess)
        if @board.code_broken?
          puts "#{@board.code.inspect} Solved in #{@board.attempts.length} attempts"
          solved_in << @board.attempts.length
          break
        end
      end 
    end

    average = solved_in.reduce(:+) / solved_in.size.to_f
    wins = solved_in.count { |rounds| rounds <= 12}
    win_rate = wins / solved_in.size.to_f
    puts "=" * 20
    puts "WIN RATE: #{wins} %"
    puts "AVERAGE TURNS: #{average}"

    exit
  end

  def win
    system 'clear'
    @board.draw
    10.times { puts "#{@current_player.name.upcase} WON!!!!" }
    exit
  end

  def loose
    system 'clear'
    @board.draw
    10.times { puts "#{@current_player.name.upcase} is a LOOSER!!!!" }
    exit
  end

  def prompt(message)
    puts message
    print "> "
    gets.chomp
  end

end

main =  Main.new
main.start