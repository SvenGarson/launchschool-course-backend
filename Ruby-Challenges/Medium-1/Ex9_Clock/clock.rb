class Clock

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hours, minutes = 0)
    self.minutes_total = (hours * MINUTES_PER_HOUR) + minutes    
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def -(minutes)
    Clock.new(0, minutes_total - minutes)
  end

  def +(minutes)
    Clock.new(0, minutes_total + minutes)
  end

  def ==(other_clock)
    minutes_total == other_clock.minutes_total
  end

  def to_s

    clock_hours = (minutes_total / MINUTES_PER_HOUR) % HOURS_PER_DAY
    clock_minutes = minutes_total % MINUTES_PER_HOUR

    format('%02d:%02d', clock_hours, clock_minutes)
  end

  protected

  attr_reader(:minutes_total)

  private

  attr_writer(:minutes_total)

end