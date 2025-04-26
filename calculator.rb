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
    extract_numbers
    validate_numbers
    numbers.sum
  end

  private

  attr_reader :number_string
  attr_accessor :delimiter, :valid_number_string, :numbers

  def extract_numbers
    extract_number_string_and_delimiter

    self.numbers = valid_number_string
      .split(regex)
      .map { |number| unmask_negative_numbers(number) }
      .map(&:to_i)
  end

  def extract_number_string_and_delimiter
    self.valid_number_string = number_string
    self.delimiter = DEFAULT_DELIMITER

    if number_string.start_with?('//')
      delimiter_string, numbers_part = number_string.split(NEW_LINE_CHARACTER, 2)
      self.delimiter = delimiter_string[2]
      self.valid_number_string = mask_negatives_for_hyphen_as_delimiter(numbers_part)
    end
  end

  def mask_negatives_for_hyphen_as_delimiter(numbers_part)
    numbers_part.gsub('--', '-~')
  end

  def unmask_negative_numbers(number)
    number.gsub('~', '-')
  end

  def validate_argument_type
    raise ArgumentError unless @number_string.is_a?(String)
  end

  def validate_numbers
    negative_number = numbers.find(&:negative?)
    raise "negative numbers not allowed #{negative_number}" if negative_number
  end

  def regex
    /#{Regexp.escape(delimiter)}|#{Regexp.escape(NEW_LINE_CHARACTER)}/
  end
end
