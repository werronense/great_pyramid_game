# list the necessary classes
class Game
  @@turn_number = 0
  @@resources = {
    food: 500 * rand(1..10),
    manpower: 100 * rand(1..10)
  }
  @@pyramid_status = 0.0

  def self.turn_count
    @@turn_number
  end

  def self.get_resources
    @@resources
  end

  def self.get_pyramid_status
    @@pyramid_status
  end
end

class Turn < Game
  def initialize
    @@turn_number += 1
  end

  def print_state
    puts "Turn number #{Game.turn_count}"
    resources = Game.get_resources
    puts "Available food: #{resources[:food]}"
    puts "Available manpower: #{resources[:manpower]}"
    puts "Pyramid status: #{Game.get_pyramid_status * 100} percent built"
  end
end

class Engine
  def play
    while Game.turn_count < 10
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
