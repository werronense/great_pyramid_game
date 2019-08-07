# list the necessary classes
class Turn
  @@turn_number = 0
  @@resources = {
    food: 500 * rand(1..10),
    manpower: 100 * rand(1..10)
  }
  @@pyramid_status = 0.0

  def initialize
    @@turn_number += 1
    puts "Initial event" # test
  end

  def self.turn_count
    @@turn_number
  end

  def print_state
    puts "Turn number #{@@turn_number}"
    puts "Available food: #{@@resources[:food]}"
    puts "Available manpower: #{@@resources[:manpower]}"
    puts "Pyramid status: #{@@pyramid_status * 100} percent built"
  end
end

class Engine
  def play
    while Turn.turn_count < 10
      current_turn = Turn.new
      current_turn.print_state
    end
  end
end

class Event
end

# test
game = Engine.new
game.play
