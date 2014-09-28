class MoneyRange

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_s
    value.times.inject('') { |m, i| m + '$'  }
  end

end