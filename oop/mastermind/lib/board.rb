class Board
  attr_reader :code

  def initialize
    @code = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
    @attempts = []
    @max_attempts = 12
  end

  def set_code (value)
    valid_code?(value) ? @code = value : false
  end

  def break_attempt (attempt)
    return false unless valid_code?(attempt)
    
    result = { correct_positions: 0, correct_colors: 0}

    matched_code = @code.dup
    attempt_original = attempt.dup

    binding.pry if @code == [3,4,5,4]

    
    matched_code.each_with_index do |peg, i|
      if peg == attempt[i]
        result[:correct_positions] += 1
        matched_code[i] = nil # So it will be no longer used
        attempt[i] = nil # So it will be no longer used
      end
    end

    matched_code.each_with_index do |peg, i|
      if !peg.nil? && attempt.include?(peg)
        result[:correct_colors] += 1
        attempt.delete_at(attempt.index(peg))
      end
    end

    if result[:correct_positions] == 4
      @broken = true
    end

    @attempts << {code: attempt_original, result: result}
    result
  end

  def code_broken?
    @broken || false
  end

  def all_attempts_used?
    @attempts.length >= @max_attempts
  end

  def draw
    draw_separator
    code_broken? ? draw_revealed_code : draw_hidden_code
    draw_separator
    (@max_attempts - @attempts.length).times { draw_line([" ", " ", " ", " "])}
    @attempts.reverse.each do |line|
      draw_line(line[:code], line[:result])
    end

  end

  private

  def valid_code?(value)
    return false unless value.kind_of?(Array)
    return false if value.length != 4
    value.all? { |c| (1..6).include?(c) }
  end

  def draw_hidden_code
    puts "|   |   |   |   |"
    puts "| ? | ? | ? | ? |"
    puts "|   |   |   |   |"
  end

  def draw_revealed_code
    puts "|   |   |   |   |"
    draw_line(@code)
    puts "|   |   |   |   |"
  end

  def draw_separator
    puts "+---+---+---+---+"
  end

  def draw_line(numbers, hints={})
    numbers.each do |n|
      print "| #{colored(n)} "
    end
    print "|  "
    unless hints.empty?
      print "Correct position: #{hints[:correct_positions]} ".colorize(45)
      print "Correct colors: #{hints[:correct_colors]} ".colorize(36)
    end
    print "\n"
    draw_separator
  end

  def colored number
    case number
    when 1
      number.to_s.colorize(31)
    when 2
      number.to_s.colorize(32)
    when 3
      number.to_s.colorize(33)
    when 4
      number.to_s.colorize(34)
    when 5
      number.to_s.colorize(35)
    when 6
      number.to_s.colorize(36)
    else
      number
    end
  end


end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end
end