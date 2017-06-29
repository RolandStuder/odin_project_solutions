class Player
  attr_reader :name

  def initialize (name)
    @name = name
  end

  def prompt_for_guess (input = nil, board = nil)
    puts "Put four numbers between 1 and 6  "
    print "> "
    input ||= gets.chomp
    input = input.each_char.reduce([]) { |array, c| array << c.to_i }
  end

  def prompt_for_secret_code (input = nil)
    puts "Put you secret code of four numbers between 1 and 6  "
    print "> "
    input ||= gets.chomp
    input = input.each_char.reduce([]) { |array, c| array << c.to_i }
  end

end