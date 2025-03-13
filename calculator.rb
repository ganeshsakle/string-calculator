# frozen_string_literal: true

class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    numbers_array = numbers.tr('\n', delimiter).split(delimiter).map(&:to_i)

    raise_negatives_exception(numbers_array)
    ignore_big_numbers(numbers_array)

    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = ','

    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split('\n', 2)
      delimiter = delimiter_line[-1]
      closing_delimiter_index = delimiter_line.index(']')

      if closing_delimiter_index
        delimiter = delimiter_line[3...closing_delimiter_index]
      end
    end

    [delimiter, numbers]
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

  def ignore_big_numbers(numbers_array)
    numbers_array.reject! { |num| num > 1000 }
  end
end
