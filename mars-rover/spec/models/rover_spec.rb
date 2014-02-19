require 'spec_helper'


describe Rover do
  let(:valid_params) {
    { :x => '1', 
      :y => '2',
      :orientation => 'E'
    } 
  }

  let(:invalid_params) {
    { :x => '-1', 
      :y => '2',
      :orientation => 'E'
    } 
  }  

  let(:rover) { Rover.new valid_params }
  let(:plateau) { double('plateau', :edge_x => '5', :edge_y => '5') }

  describe 'initialize' do
    it 'successfully creates a Rover' do
      expect(rover).to be_an_instance_of Rover
    end

    it 'rover should have rovers parameters passed on creation' do
      expect(rover.pos).to eq('1 2 E')
    end
  end

  describe '#move' do    
    it 'moves the rover 1 square in the current orientation' do
      rover.move
      expect(rover.pos).to eq('2 2 E')
    end
  end

  describe '#rotate' do
    # sanity check test since the orientaion class is thoroughly tested
    it "updates the rover's orientation to north after rotating 3 times to the right" do
      3.times { rover.rotate 'R' }
      expect(rover.pos).to eq('1 2 N')
    end
  end

  describe '#out_of_bounds?' do
    it 'should return true if the rover is out of bounds' do
      rover = Rover.new invalid_params
      result = rover.out_of_bounds? plateau.edge_x, plateau.edge_y
      expect(result).to be_true
    end
  end

end