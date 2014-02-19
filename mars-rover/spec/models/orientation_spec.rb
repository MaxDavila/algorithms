require 'spec_helper'

describe Orientation do
    let(:orientation) { Orientation.new('N')}

  describe '#initialize' do
    it 'should instantiate a new orientation object' do
      expect(orientation).to be_an_instance_of Orientation
    end

    it 'current object orientation should be set to passed param' do
      expect(orientation.current).to eq('N')
    end

    it 'should raise error if orientation passed is not valid' do
      lambda { expect(Orientation.new('Q')).to raise_error(ArgumentError, 'Invalid cadinal point') }
    end
  end

  describe '#update' do
    let(:direction) { ['L', 'R'] }

    it 'should update current orientation to E when passed right' do
      orientation.update direction.last
      expect(orientation.current).to eq('E')
    end

    it 'should update current orientation to W when passed left' do
      orientation.update direction.first
      expect(orientation.current).to eq('W')
    end

    it 'should update current orientation back to N when passed right 4 times' do
      4.times { orientation.update direction.last }
      expect(orientation.current).to eq('N')
    end

    it 'should update current orientation back to N when passed left 4 times' do
      4.times { orientation.update direction.first }
      expect(orientation.current).to eq('N')
    end
  end
end