require './lib/game.rb'
require './lib/player.rb'
require './lib/ai_player.rb'


class Main
  attr_accessor :players

  def initialize
    @players = []
  end


  def play
    puts "Welcome to the TicTacToe"

    puts "Play"
    puts "1) Human vs. Human"
    puts "2) Human vs. Computer (Learning)"
    puts "3) Computer (Random) vs. Computer (Learning)"
    puts "4) AI fast mode (Smart vs. Random)"
    puts "5) AI fast mode (Smart vs. Smart)"

    game_mode = gets.chomp.to_i

    case game_mode
    when 1
      human_player("one")
      human_player("two")
    when 2
      human_player("one")
      computer_player("two", :both)
    when 3
      computer_player("one")
      computer_player("two", :both)
    when 4
      computer_player("Computer (Learning)", :both)
      computer_player("Computer (Random)", :none)
      fast_mode
    when 5
      computer_player("Computer (Learning)", :both)
      computer_player("Computer (Learning)", :both)
      fast_mode
    else
      exit
    end

    loop do
      round = Game.new(@players)
      round.start
      puts

      @players.each do |player|
        puts "#{player.name} now has #{player.win_count} wins (#{player.win_percentage})"
      end

      puts "New Game? (y/n)"
      input = gets.chomp
      exit unless input.downcase == "y"
    end
  end

  def fast_mode
    counter = 0
    time = Time.now
    loop do
      round = Game.new(@players)
      round.display = false
      round.start
      counter += 1
      if counter % 10 == 0
        system 'clear'
        puts "=========================="
        puts "Statistics for #{@players[0].statistics[:games]} games"
        puts "=========================="
        statistics(@players[0])
        statistics(@players[1])
      end
      if counter == 1000
        puts "Time: #{Time.now - time}"
        exit
      end
    end
  end

  def statistics(player)
    puts "=========================="
    puts "#{player.name.upcase}"
    puts "Win percentage TOTAL:               #{player.statistics[:win_percentage]}"
    puts "Win percentage for last 100 Games:  #{player.statistics(last: 100)[:win_percentage]}"
    puts "Loss percentage for last 100 Games: #{player.statistics(last: 100)[:loss_percentage]}"
    puts "Tie percentage for last 100 Games:  #{player.statistics(last: 100)[:tie_percentage]}"
  end


  def human_player(number)
    puts "Name player #{number}: "
    name = gets.chomp
    @players << Player.new(name)
  end

  def computer_player(name, strategy = "")
    @players << AIPlayer.new(name, strategy)
  end
end

game = Main.new
game.play

