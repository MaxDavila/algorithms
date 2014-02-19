class Rover
  # decided to initialize the rover with args as opposed to options hash
  # because the size of the attributes given is trivial. 
  def initialize options
    @x = options[:x].to_i
    @y = options[:y].to_i
    @orientation = Orientation.new(options[:orientation])
  end

  # moves the rover towards its current orientation using one of the 
  # private methods below. Use key value mapping if cardinal directions increase.
  def move 
    self.send(@orientation.current.to_sym)
  end

  def rotate direction
    @orientation.update direction
  end

  def pos
    "#{@x} #{@y} #{@orientation.current}"
  end

  def out_of_bounds? x_bound, y_bound
    return true if @x < 0 or @y < 0 or @x > x_bound or @y > y_bound
  end

  private
  # moves the rover forward
  def N
    @y += 1
  end

  # moves the rover right
  def E
    @x += 1
  end

  # moves the rover down
  def S
    @y -= 1
  end

  # moves the rover left
  def W
    @x -= 1
  end

end
