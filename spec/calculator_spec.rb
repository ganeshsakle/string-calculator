# frozen_string_literal: true

require 'rspec'
require_relative '../calculator'

RSpec.describe Calculator do
  subject(:add) { Calculator.new.add(numbers) }

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

  context 'when number has any amount of numbers' do
    let(:numbers) { '1,2,3,4,5' }

    it { is_expected.to eq 15 }
  end

  context 'when number has new lines between numbers' do
    let(:numbers) { '1\n2,3' }

    it { is_expected.to eq 6 }
  end

  context 'when there is a new line character after delimiter changer' do
    let(:numbers) { '//;\n1;2' }

    it { is_expected.to eq 3 }
  end

  context 'when number has negative digits' do
    let(:numbers) { '1,-2\n-3' }

    it 'raises an exception for negative numbers' do
      expect { add }.to raise_error(RuntimeError, 'negative numbers not allowed -2, -3')
    end
  end

  context 'when number has numbers bigger than 1000' do
    let(:numbers) { '1,1001,2,1002,3' }

    it { is_expected.to eq 6 }
  end

  context 'when number has any length of delimiters' do
    let(:numbers) { '//[***]\n1***2***3' }

    it { is_expected.to eq 6 }
  end

  context 'when number has multiple custom delimiters' do
    let(:numbers) { '//[*][%]\n1*2%3' }

    it { is_expected.to eq 6 }
  end

  context 'when multiple delimiter has length more than 1' do
    let(:numbers) { '//[*^][%&]\n1*^2%&3\n4*^5%&6' }

    it { is_expected.to eq 21 }
  end
end
