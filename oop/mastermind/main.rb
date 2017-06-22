require './lib/board.rb'
require 'pry'


class Main

  def initialize
    @board = Board.new
  end


  def play
      system 'clear'

    loop do
      system 'clear'
      @board.draw

      puts "Put four numbers between 1 and 6  "
      print "> "
      input = gets.chomp
      input = input.each_char.reduce([]) { |array, c| array << c.to_i }

      @board.break_attempt(input)
      win if @board.code_broken?
      loose if @board.all_attempts_used?

    end 
  end

  def win
    system 'clear'
    @board.draw
    10.times { puts "YOU ARE AWESOME YOU WON!!!!" }
    exit
  end

  def loose
    system 'clear'
    @board.draw
    10.times { puts "LOOSER!!!!" }
    exit
  end

end

main =  Main.new
main.play