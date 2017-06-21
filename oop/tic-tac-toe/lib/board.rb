require 'pry'


class Board
  attr_reader :tiles

  def initialize
    @tiles = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def draw
    draw_empty_line
    @tiles.each do |row|
      draw_line(row)
      draw_empty_line
    end
  end

  def put (tile, x, y)
    return false unless (0..2).include?(x) 
    return false unless (0..2).include?(y) 
    return false unless [:x, :o].include?(tile) 

    return false unless @tiles[x][y].class == Fixnum 
    @tiles[x][y] = tile
  end

  private

  def draw_empty_line
    puts "+---+---+---+"
  end

  def draw_line arr
    arr.each do |field| 
      field ||=  " "
      case field
      when :x then field = x 
      when :o then field = o
      else
        field = field.to_s.colorize("white")
      end
      print "| #{field} "
    end
    print "|\n"
  end

  def x
    "x".colorize(:red)
  end

  def o
    "o".colorize(:cyan)
  end
end

class String
  def colorize(color)
    case color
      when :red then color_code = 31
      when :green then color_code = 32
      when :cyan then color_code = 36
      when :white then color_code = 33
      # when :grey then color_code = 40
      else color_code = 33
    end

    "\e[#{color_code}m#{self}\e[0m"
  end
end
