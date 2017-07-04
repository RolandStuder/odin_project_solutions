require './lib/game.rb'
require './lib/string.rb'
require './lib/prompt.rb'


class Main
  include Prompt

  def start
    load_game = prompt("Load previous game?", valid_responses: ['y','n'])
    
    if load_game == 'y'
      game = Game.load_game
    else
      game = Game.new
    end
    game.start
  end
end

main = Main.new
main.start
