require 'spec_helper'

describe InputReader do

	describe '#get_dimensions_of_world' do 

		let!(:file) { FileReader.open('seed_files/test_input.txt') }

		let(:input) { InputReader.new(file) }
		it 'should return a array with the dimensions of the world' do 
			dimensions = input.get_dimensions_of_world
			expect(dimensions).to eq([5, 5])

		end
	end
	
end