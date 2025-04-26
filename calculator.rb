class Calculator
  DELIMITER = ','.freeze

  def self.add(number_string)
    new(number_string).add
  end

  def initialize(number_string)
    @number_string = number_string
  end

  def add
    get_numbers_array.sum
  end

  private

  attr_reader :number_string

  def get_numbers_array
    number_string.split(DELIMITER).map(&:to_i)
  end
end
