require './lib/prompt.rb'
require 'pry'
require 'yaml'

class Game
  include Prompt

  def initialize
    @@dictionnary ||= File.readlines('data/dictionnary.txt')
    @word = get_word
    @remaining_letters = ('a'..'z').to_a
    @guesses = []
    @guesses_left = 5
  end

  def start

    draw_state
    loop do 
      attempt = prompt("Your guess",valid_responses: @remaining_letters)
      guess(attempt)
      if solved?
        draw_state
        puts "You win!"
        exit
      elsif lost?
        draw_state
        puts "You lost, the word was #{@word}"
        exit
      end
      draw_state
    end
  end

  def save_game
    File.open('data/save_game.yml','w') do |file|
      file.puts YAML.dump(self)
    end
    puts "Game saved"
    exit
  end

  def self.load_game
    YAML.load( File.read( 'data/save_game.yml' ) )
  end

  def guess(char)
    @guesses << char
    @remaining_letters = @remaining_letters - char.to_a
    @guesses_left -= 1 unless @word.include?(char)
  end

  def draw_state
    system 'clear'

    draw_word
    puts "#{@guesses_left} left."
  end

  def draw_word
    @word.each_char do |char|
      @guesses.include?(char) ? print("#{char} ") : print("_ ")
    end
    print "\n"
  end

  def solved?
    (@word.to_a - @guesses).empty?
  end

  def lost?
    @guesses_left == 0
  end

  def get_word
    words = @@dictionnary
    words = words.select do |word| 
      word.gsub!(/\n/,'')
      word.length >= 5 && word.length <= 12
    end
    words.sample
  end
end