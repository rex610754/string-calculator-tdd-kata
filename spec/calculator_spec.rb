require_relative '../calculator'
require 'rspec'

RSpec.describe Calculator do
  describe '.add' do
    context 'when input is not a string' do
      it 'should validate and raise an argument error' do
        expect { described_class.add(23) }.to raise_error(ArgumentError)
      end
    end

    context 'when input is an empty string' do
      it 'should return 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'when input is a single number' do
      it 'should return the number as an integer' do
        expect(described_class.add('7')).to eq(7)
      end
    end

    context 'when input contains two numbers separated by a comma' do
      it 'should return their sum' do
        expect(described_class.add('3,5')).to eq(8)
      end
    end

    context 'when input contains numbers separated by commas and newlines' do
      it 'should return the sum of multiple numbers' do
        expect(described_class.add("4\n3,5")).to eq(12)
        expect(described_class.add("\n\n4,3,5")).to eq(12)
      end
    end

    context 'when input contains negative numbers' do
      context 'and the custom delimiter is a hyphen' do
        it 'should raise an error' do
          expect { described_class.add("//-\n3--4-\n5") }
            .to raise_error(RuntimeError, 'negative numbers not allowed -4')
        end
      end

      context 'and the custom delimiter is not a hyphen' do
        it 'should raise an error' do
          expect { described_class.add("4\n3,-5") }.to raise_error(RuntimeError, 'negative numbers not allowed -5')
          expect { described_class.add("//;\n3;-4") }.to raise_error(RuntimeError, 'negative numbers not allowed -4')
        end
      end
    end
  end
end
