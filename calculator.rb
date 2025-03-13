# frozen_string_literal: true

class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    numbers = numbers.sub('//[^\n]*\n', '') if numbers.start_with?('//')

    numbers.tr('\n', delimiter).split(delimiter).map(&:to_i).sum
  end

  private

  def extract_delimiter(numbers)
    numbers.start_with?('//') ? numbers.split('\n', 2).first[-1] : ','
  end
end
