class Player
  attr_accessor :name, :tile
  attr_reader :win_count, :loss_count

  def initialize(name = "No Name")
    @name = name
    @win_count = 0
    @loss_count = 0
    @draw_count = 0
  end

  def prompt_for_action
    puts "Where do you puts your tile? (1 to )"
    input = gets.chomp
    return input.scan(/\d/)[0]
  end

  def wins
    @win_count += 1
  end

  def loses
    @loss_count += 1
  end

  def draws
    @draw_count += 1
  end

  def win_percentage
    percentage = @win_count.to_f / (@win_count + @loss_count + @draw_count)
    (percentage * 100).to_s << "%"
  end

  def statistics
    {wins: @win_count, losses: @loss_count, draws: @draw_count, win_percentage: win_percentage}
  end
end