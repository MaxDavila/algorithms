class InputReader 

	def initialize file
		@file = file
	end

	def get_dimensions_of_world
		line = @file.shift.strip
		line.split.map(&:to_i)
	end
end