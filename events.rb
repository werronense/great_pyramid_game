class Event
  def initialize(food, manpower, pyramid_status)
    @food = food
    @manpower = manpower
    @pyramid_status = pyramid_status
  end

  def print_result
    puts "You now have #{@@state[:food]} food, #{@@state[:manpower]} "
    puts "manpower, and your pyramid is #{@@state[:pyramid_status] * 100} "
    puts "percent complete."
  end
end

class Earthquake < Event
  def occur
    puts "An earthquake damages your pyramid and kills many people in your "
    puts "city."
    {manpower: 1 - rand(0.05..0.1), pyramid_status: 1 - rand(0.1..0.25)}
  end
end
