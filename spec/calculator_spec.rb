# frozen_string_literal: true

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

  context 'when number has any amount of numbers' do
    let(:numbers) { '1,2,3,4,5' }

    it { is_expected.to eq 15 }
  end

  context 'when number has new lines between numbers' do
    let(:numbers) { '1\n2,3' }

    it { is_expected.to eq 6 }
  end

  context 'when number has different delimiters' do
    context 'when there is no new line character after delimiter changer' do
      let(:numbers) { '//;\n1;2' }

      it { is_expected.to eq 3 }
    end

    context 'when there is a new line character after delimiter changer' do
      let(:numbers) { '//;\n1;2' }

      it { is_expected.to eq 3 }
    end
  end
end
