# frozen_string_literal: true

class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.tr('\n', ',').split(',').map(&:to_i).sum
  end
end
