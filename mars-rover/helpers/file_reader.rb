
module FileReader
  extend self
  
  def open filename
    IO.readlines filename
  end

end



