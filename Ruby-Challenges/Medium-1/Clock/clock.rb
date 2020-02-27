class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hours = 0, minutes = 0)
    self.total_minutes = normalize_minutes(hours_to_minutes(hours) + minutes)
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def +(minutes)
    Clock.new(0, total_minutes + minutes)
  end

  def -(minutes)
    Clock.new(0, total_minutes - minutes)
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end

  protected

  attr_reader(:total_minutes)

  private

  def hours
    (total_minutes / MINUTES_PER_HOUR) % HOURS_PER_DAY
  end

  def minutes
    total_minutes % 60
  end

  def hours_to_minutes(hours)
    hours * MINUTES_PER_HOUR
  end

  def normalize_minutes(minutes)
    minutes % MINUTES_PER_DAY
  end

  attr_writer(:total_minutes)
end
