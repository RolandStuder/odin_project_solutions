require 'pry'
require './lib/matcher.rb'

class AIPlayer < Player
  include Matcher

  def initialize(name = "Computer AI")
    super
  end

  def prompt_for_guess(input = nil, board = nil)
    if board.attempts.length == 0
      @possible_combinations = all_combinations
    else
      @possible_combinations = remove_impossible(@possible_combinations, board.attempts.last)      
    end
    exit if @possible_combinations.length == 0
    @possible_combinations.sample
  end

  def prompt_for_secret_code
    [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
  end

  def all_combinations
    all = []
    (1..6).each do |a|
      (1..6).each do |b|
        (1..6).each do |c|
          (1..6).each do |d|
            all << [a,b,c,d]
          end
        end
      end
    end
    return all
  end

  def remove_impossible (possible, attempt)
    success = attempt[:result]
    possible = possible.select do |code|
      possible?(code,attempt)
    end
    possible
  end

  def possible?(code, attempt)
    matching = peg_match(code, attempt[:code])
    success = attempt[:result]
    return false if matching[:positions] > success[:positions]
    return true
  end
end