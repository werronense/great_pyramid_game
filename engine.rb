require "./turn.rb"

class Engine
  def play
    while Turn.turn_count < 10
      current_turn = Turn.new
      # test
      if Turn.turn_count == 6
        current_turn.run_event
      end
      current_turn.end_turn
    end
  end
end
