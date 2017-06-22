class Player
  attr_accessor :name, :tile

  def initialize(name = "No Name", strategy = nil)
    @name = name
    @game_results = []
  end

  def prompt_for_action(moves)
    puts "Where do you puts your tile? (1 to 9)"
    input = gets.chomp
    return input.scan(/\d/)[0].to_i
  end

  def wins(moves)
    @game_results << :win
  end

  def loses(moves)
    @game_results << :loss
  end

  def ties
    @game_results << :tie
  end

  def statistics(options={})
    last = options[:last]
    if last && @game_results.length > last
      selected_results = @game_results[(-last)..-1]
    else
      selected_results = @game_results
    end

    results = selected_results.reduce({ wins: 0, losses: 0, ties: 0}) do |res, match_result| 
      case match_result
      when :win 
       res[:wins]   += 1 
      when :loss 
       res[:losses] += 1 
      when :tie  
       res[:ties]   += 1 
      end
      res
    end
    results[:games] = results[:wins] + results[:losses] + results[:ties]
    results[:win_percentage] = percentage_for(:wins, results)
    results[:loss_percentage] = percentage_for(:losses, results)
    results[:tie_percentage] = percentage_for(:ties, results)
    results
  end

  def percentage_for(outcome, results)
    percentage = results[outcome].to_f / results[:games]
    (percentage * 100).to_i.to_s << "%"
  end

  def statistics_for_last(number)
    if @win_loss_draw.length < number
      return statistics
    else
      results = @win_loss_draw[(-number)..-1].reduce({ wins: 0, losses: 0, draws: 0}) do |res, match_result| 
        res[match_result] += 1
        res
      end
      return results
    end
  end
end