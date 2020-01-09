class Series

  def initialize(series_string)
    @series = series_string.chars.map(&:to_i)
  end

  def slices(cons)
    raise ArgumentError if cons > @series.length
    slices = Array.new
    @series.each_cons(cons) do |cons_numbers|
      slices << cons_numbers
    end
    slices
  end

end