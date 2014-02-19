require 'spec_helper'

describe Plateau do
  describe "#initialize" do
    let(:plateau) { Plateau.new([5, 5]) }
    it 'should create an instance of Plateau' do
      expect(plateau).to be_an_instance_of Plateau
    end

    it 'should have two edges' do
      expect(plateau.edge_x).to eq(5)
      expect(plateau.edge_y).to eq(5)
    end
  end
end