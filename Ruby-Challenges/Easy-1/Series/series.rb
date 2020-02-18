class Series
  def initialize(digit_string)
    self.digit_array = digit_string.chars.map(&:to_i)
  end

  def slices(series_length)
    unless series_length_valid?(series_length)
      raise ArgumentError, "Series length longer than the digit string!"
    end

    series_list = Array.new
    digit_array.each_cons(series_length) do |series|
      series_list << series
    end

    series_list
  end

  private

  def series_length_valid?(series_length)
    series_length <= digit_array.size
  end

  attr_accessor(:digit_array)
end
