class Calculator
  DEFAULT_DELIMITER = ','.freeze
  NEW_LINE_CHARACTER = "\n".freeze

  def self.add(number_string)
    new(number_string).add
  end

  def initialize(number_string)
    @number_string = number_string
    validate_argument_type
  end

  def add
    extract_number_string
    get_numbers_array.sum
  end

  private

  attr_reader :number_string
  attr_accessor :delimiter, :valid_number_string

  def validate_argument_type
    raise ArgumentError unless @number_string.is_a?(String)
  end

  def get_numbers_array
    valid_number_string.split(regex).map(&:to_i)
  end

  def extract_number_string
    self.valid_number_string = number_string
    self.delimiter = DEFAULT_DELIMITER

    if number_string.start_with?('//')
      delimiter_string, numbers_part = number_string.split(NEW_LINE_CHARACTER, 2)
      self.delimiter = delimiter_string[2]
      self.valid_number_string = numbers_part
    end
  end

  def regex
    /#{Regexp.escape(delimiter)}|#{Regexp.escape(NEW_LINE_CHARACTER)}/
  end
end
