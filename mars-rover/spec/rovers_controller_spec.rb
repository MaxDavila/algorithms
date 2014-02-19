require 'spec_helper'

describe RoversController do
  let(:controller) { RoversController.new('seed_files/test_input.txt') }
  describe '#initialize' do
    it 'should instantiate a new rover controller' do
      expect(controller).to be_a RoversController
    end
  end

  describe '#start' do

    it 'should print the final position for all rovers in the plateau' do
      expect(STDOUT).to receive(:puts).with('1 3 N')
      expect(STDOUT).to receive(:puts).with('5 1 E')
      controller.start
    end 

    it 'should stdout when rover is out of bounds' do
      controller = RoversController.new('seed_files/invalid_input.txt')

      expect(STDOUT).to receive(:puts).with('your rover fell out of bounds and got destroyed :(')
      expect(STDOUT).to receive(:puts).with('-1 2 W')
      expect(STDOUT).to receive(:puts).with('3 1 E')
      controller.start
    end


  end

end
