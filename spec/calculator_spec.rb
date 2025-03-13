require 'rspec'
require_relative '../calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = Calculator.new
      result = calculator.add('')
      expect(result).to eq(0)
    end
  end
end