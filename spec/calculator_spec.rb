require_relative '../calculator'
require 'rspec'

RSpec.describe Calculator do
  describe '.add' do
    context 'when input is an empty string' do
      it 'should return 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'when input is a single number' do
      it 'should return that number as integer' do
        expect(described_class.add('7')).to eq(7)
      end
    end

    context 'when input is two numbers separated by comma' do
      it 'should return their sum' do
        expect(described_class.add('3,5')).to eq(8)
      end
    end

    context 'when numbers separated by commas and newlines' do
      it 'should return the sum of multiple numbers' do
        expect(described_class.add("4\n3,5")).to eq(12)
        expect(described_class.add("\n\n4,3,5")).to eq(12)
      end
    end
  end
end
