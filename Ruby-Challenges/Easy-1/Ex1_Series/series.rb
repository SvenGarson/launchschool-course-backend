class Series

  def initialize(series_string)
    @series = series_string.chars.map(&:to_i)
  end

  def slices(cons)
    raise ArgumentError if cons > @series.length
    series.each_cons(cons).to_a
  end

  private 

  attr_reader :series

end