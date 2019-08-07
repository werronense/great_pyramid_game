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
    print_game_state
  end

  def self.turn_count
    @@turn_number
  end

  def print_turn
    puts "Turn number #{@@turn_number}"
  end

  def print_resources
    puts "Available food: #{@@resources[:food]}"
    puts "Available manpower: #{@@resources[:manpower]}"
  end

  def print_pyramid
    puts "Pyramid status: #{@@pyramid_status * 100} percent built"
  end

  def print_game_state
    print_turn
    print_resources
    print_pyramid
  end

  def run_event
    event = Event.new(
      @@resources[:food],
      @@resources[:manpower],
      @@pyramid_status
    )
  end
end

class Engine
  def play
    while Turn.turn_count < 10
      current_turn = Turn.new
      current_turn.run_event
    end
  end
end

class Event
  def initialize(food, manpower, pyramid_status)
    @food = food
    @manpower = manpower
    @pyramid_status = pyramid_status
  end
end

# test
game = Engine.new
game.play
