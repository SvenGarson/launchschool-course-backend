class Vector2D
  
  attr_accessor(:x, :y)
  
  def initialize(x, y)
    self.x = x
    self.y = y
  end

  def +(other_vector)
    Vector2D.new(x + other_vector.x, y + other_vector.y)
  end

  def to_a
    [x, y]
  end

  def to_s
    "[#{x}, #{y}]"
  end
end

class Robot

  CARD_NORTH = :north
  CARD_EAST  = :east
  CARD_SOUTH = :south
  CARD_WEST  = :west
  CARDINAL_DIRECTIONS = [CARD_NORTH, CARD_EAST, CARD_SOUTH, CARD_WEST]
  CARDINAL_DIRECTIONS_VECTORS = [
    Vector2D.new(0, 1),
    Vector2D.new(1, 0),
    Vector2D.new(0, -1),
    Vector2D.new(-1, 0)
  ]

  attr_reader(:bearing)

  def initialize
    self.position = Vector2D.new(0, 0)
    orient(CARD_NORTH)
  end

  def orient(new_cardinal_direction)
    if CARDINAL_DIRECTIONS.include?(new_cardinal_direction)
      self.bearing = new_cardinal_direction
    else
      raise ArgumentError, "'#{new_cardinal_direction}' is not a cardinal direction!"
    end
  end

  def turn_right
    # +1 rotates right-wards
    self.bearing = cardinal_direction_for_turn_direction(1)
  end

  def turn_left
    # -1 rotates left-wards
    self.bearing = cardinal_direction_for_turn_direction(-1)
  end

  def at(new_x, new_y)
    position.x = new_x
    position.y = new_y
  end

  def coordinates
    position.to_a
  end

  def advance
    bearing_index = CARDINAL_DIRECTIONS.index(bearing)
    movement_vector = CARDINAL_DIRECTIONS_VECTORS[bearing_index]
    new_position = position + movement_vector
    at(new_position.x, new_position.y)
  end

  private

  def cardinal_direction_for_turn_direction(turn_direction)
    next_cardinal_direction_index = CARDINAL_DIRECTIONS.index(bearing) + turn_direction
    next_cardinal_direction_index = next_cardinal_direction_index % CARDINAL_DIRECTIONS.size
    CARDINAL_DIRECTIONS[next_cardinal_direction_index]
  end

  attr_writer(:bearing)
  attr_accessor(:position)
end

class Simulator
  
  CMD_LEFT    = :turn_left
  CMD_RIGHT   = :turn_right
  CMD_ADVANCE = :advance
  COMMAND_MAP = {
    'L' => CMD_LEFT,
    'R' => CMD_RIGHT,
    'A' => CMD_ADVANCE
  }

  def initialize
    self.robots = Array.new
  end

  def instructions(rla_command_string)
    command_characters = rla_command_string.chars
    commands = Array.new
    
    command_characters.each do |command_char|
      next unless rla_command_exists?(command_char)

      commands << COMMAND_MAP[command_char]
    end

    commands
  end

  def place(robot, x: , y: , direction: )
    # can add every robot only once
    return if robots.include?(robot)

    robot.at(x, y)
    robot.orient(direction)
    robots << robot
  end

  def evaluate(robot, rla_command_string)
    rla_commands = instructions(rla_command_string)
    
    rla_commands.each do |command|
      command_string = command.to_s
        
      next unless robot.respond_to?(command_string)

      robot.__send__(command_string)
    end
  end

  private

  def rla_command_exists?(rla_command)
    COMMAND_MAP.has_key?(rla_command)
  end

  attr_accessor(:robots)

end