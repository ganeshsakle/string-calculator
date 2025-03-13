# frozen_string_literal: true

class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    numbers = numbers.sub('//[^\n]*\n', '') if numbers.start_with?('//')

    numbers_array = numbers.tr('\n', delimiter).split(delimiter).map(&:to_i)

    raise_negatives_exception(numbers_array)

    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    numbers.start_with?('//') ? numbers.split('\n', 2).first[-1] : ','
  end

  def raise_negatives_exception(numbers_array)
    raise_negative_exception(numbers_array) if negatives_found?(numbers_array)
  end

  def negatives_found?(numbers_array)
    numbers_array.any?(&:negative?)
  end

  def raise_negative_exception(numbers_array)
    negatives = numbers_array.select(&:negative?)

    raise "negative numbers not allowed #{negatives.join(', ')}"
  end
end
