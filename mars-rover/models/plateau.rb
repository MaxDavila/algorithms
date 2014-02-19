# I decided to make this a class in case we need to support collisions 
# in the future.
class Plateau
  attr_reader :edge_x, :edge_y
  
  def initialize sides
    @edge_x, @edge_y = sides
  end

end

