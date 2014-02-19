class Orientation 
  attr_reader :current

  def initialize orientation
    @current = orientation
    @cardinal_points = ['N', 'E', 'S', 'W']

    validate_orientation
  end

  def update direction
    direction == 'R' ? @current = @cardinal_points[get_next] : @current = @cardinal_points[get_previous]
  end

  private
  
  def get_next 
    index = @cardinal_points.index(@current)
    index == 3 ? 0 : index + 1
  end

  def get_previous 
    index = @cardinal_points.index(@current)
    index.zero? ? 3 : index - 1
  end

  def validate_orientation
    raise ArgumentError, 'Invalid cardinal point' unless @cardinal_points.include? @current
  end
end