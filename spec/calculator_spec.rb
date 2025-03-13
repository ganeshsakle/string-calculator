require 'rspec'
require_relative '../calculator'

RSpec.describe Calculator do
  subject { Calculator.new.add(numbers) }

  let(:numbers) { '' }

  context 'when number is empty' do
    it { is_expected.to eq 0 }
  end

  context 'when number has single digit' do
    let(:numbers) { '1' }

    it { is_expected.to eq 1 }
  end

  context 'when number has two digits' do
    let(:numbers) { '1,2' }

    it { is_expected.to eq 3 }
  end
end