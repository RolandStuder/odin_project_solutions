require './lib/game.rb'
require './lib/player.rb'
require './lib/ai_player.rb'


class Main
  attr_accessor :players

  def self.play
    puts "Welcome to the TicTacToe"

    @players = []


    puts "Play"
    puts "1) Human vs. Human"
    puts "2) Human vs. Computer"
    puts "3) Computer vs. Computer"

    game_mode = gets.chomp.to_i

    case game_mode
    when 1
      human_player("one")
      human_player("two")
    when 2
      human_player("one")
      computer_player("two")
    when 3
      computer_player("one")
      computer_player("two")
    else
      exit
    end

    loop do
      game = Game.new(@players)
      game.start
      puts

      @players.each do |player|
        puts "#{player.name} now has #{player.win_count} wins (#{player.win_percentage})"
      end

      puts "New Game? (y/n)"
      input = gets.chomp
      exit unless input.downcase == "y"
    end
  end


  def self.human_player(number)
    puts "Name player #{number}: "
    name = gets.chomp
    @players << Player.new(name)
  end

  def self.computer_player(number)
    @players << AIPlayer.new("Computer #{number}")
  end
end

Main.play


