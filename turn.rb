require "./events.rb"

class Turn
  @@state = {
    turn_number: 0,
    food: 500 * rand(1..10),
    manpower: 100 * rand(5..10),
    pyramid_status: 0.0
  }

  def initialize
    @@state[:turn_number] += 1
    print_game_state
  end

  def self.turn_count
    @@state[:turn_number]
  end

  def print_turn
    puts "Turn number #{@@state[:turn_number]}"
  end

  def print_resources
    puts "Available food: #{@@state[:food]}"
    puts "Available manpower: #{@@state[:manpower]}"
  end

  def print_pyramid
    puts "Pyramid status: #{@@state[:pyramid_status] * 100} percent built"
  end

  def print_game_state
    print_turn
    print_resources
    print_pyramid
  end

  def run_event
    event = Earthquake.new( # temporarity set to Earthquake
      @@state[:food],
      @@state[:manpower],
      @@state[:pyramid_status]
    )

    event_effects = event.occur

    event_effects.each do |effect|
      @@state[effect[0]] *= effect[1]
    end
  end

  def end_turn
    # population growth at rate of 1 to 2.5 %
    new_manpower = @@state[:manpower] * (1 + rand(0.01..0.025))
    @@state[:manpower] = new_manpower.to_i
  end
end
