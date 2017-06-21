class AIPlayer < Player
  def prompt_for_action
    sleep(0.5)
    rand(1..9)
  end
end