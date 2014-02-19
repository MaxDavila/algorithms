$LOAD_PATH.unshift(File.expand_path('.'))

require 'models/orientation'
require 'helpers/file_reader'
require 'models/rover'
require 'models/plateau'

class RoversController

  def initialize file
    @file = FileReader.open file

    @input = InputReader.new @file
  end

  def start
    @plateau =  Plateau.new @input.get_dimensions_of_world
    handle_rovers 
  end
  private

  # creates a rover per rover line in the file, then delegaets directives to another method. 
  def handle_rovers 
    while @file.length > 0
      @rover = Rover.new from_options_hash

      next if rover_is_out_of_bounds
      handle_rover_directives 
      puts @rover.pos
    end
  end

  # splitting the directives line and choosing between moving or rotating the rover,
  # use the command pattern if directives become more complex 
  def handle_rover_directives  
    directives = @file.shift.strip
    directives.split('').each do |directive|
      if directive == 'M'
        break if rover_is_out_of_bounds
        @rover.move 
      else
        @rover.rotate directive
      end
    end
  end

  # create options hash from line directive in case more attributes are needed
  def from_options_hash
    keys = [:x, :y, :orientation]
    values = @file.shift.strip.split
    values.each_with_object({}) do |value, hash|
      hash[keys.shift] = value
    end
  end

  def rover_is_out_of_bounds
    if @rover.out_of_bounds?(@plateau.edge_x, @plateau.edge_y)
      puts "your rover fell out of bounds and got destroyed :("
      return true
    end 
  end
end


if $0 == __FILE__

c = RoversController.new('seed_files/test_input.txt')
c.start
end

