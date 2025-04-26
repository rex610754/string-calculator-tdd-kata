class Calculator
  def self.add(number_string)
    new(number_string).add
  end

  def initialize(number_string)
    @number_string = number_string
  end

  def add
  end

  private

  attr_accessor :number_string
end