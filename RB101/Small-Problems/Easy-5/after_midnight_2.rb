=begin

  input (for both methods before_ / after_ ):
    string with time of day in the format 'hh:mm' in 24 hour format

  output:
    the number of minutes before/after midnight to the time argument

  requirements:
    explicit:
      output range is 0..1439
      cannot use Date and Time class methods
      24:00 is not a valid 24 hour format time
      methods names after_midnight and before_midnight
    implicit:

  mental model:
    Return the number of minutes from midnight (before or after) to the
    time given as string as number in the range 0..1439 minutes

  test cases:

    after midnight
      inp: '12:34'
      out: 754

      hours after = (12 % 24) = 12
      mins  after = 34        34
      minutes after total = 12 * 60 + 34 = 754

      inp: '24:00'
      out: 0

      hours after = (24 % 24) = 0
      mins  after = 0         = 0
      minutes after total = 0 * 60 + 0 = 0

      inp: '00:00'
      out: 0

      hours after = (0 % 24) = 0
      mins  after = 0        = 0
      minutes after total = 0 * 60 + 0 = 0

    before midnight
      inp: '12:34'
      out: 686

      minutes total = minutes per day - minutes after midnight 
                    = 1440 - 754 = 686

      inp: '24:00'
      out: 0

      -> if inp == 24 || 0 then inp = inp % 24
      minutes total = minutes per day - minutes after midnight 
                    = 0 - 0 = 0
        
      inp: '00:00'
      out: 0

      -> if inp == 24 || 0 then inp = inp % 24
      minutes total = minutes per day - minutes after midnight 
                    = 0 - 0 = 0


  ds and algo:

    after midnight:
      - convert string clock representation to array of hours and minutes
      - hours after midnight   = (hours % 24)
      - minutes after midnight = minutes
      - total minutes adter midnight = hours after * 60 * minutes after
      - return that value

    before midnight:
      since a day has x minutes in total (24 * 60 = 1440 minutes) and the
      relationship 1440 = before midnight + after midnight is true,
      before midnight can be computes as:
      
      -> if inp == 24 || 0 then inp = inp % 24
      -> before midnight = 1440 - after midnight


    
=end
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def hours_minutes_from(clock)
  clock.split(':')
end

def after_midnight(clock)
  hours, minutes = hours_minutes_from(clock).map { |str| str.to_i }
  hours %= HOURS_PER_DAY
  hours * MINUTES_PER_HOUR + minutes
end

def before_midnight(clock)
  hours, minutes = hours_minutes_from(clock).map { |str| str.to_i }
  minutes_per_day = (hours == 24 || hours == 0) ? 0 : MINUTES_PER_DAY
  minutes_per_day - after_midnight(clock)
end

p after_midnight('00:00')  == 0
p before_midnight('00:00') == 0

p after_midnight('12:34')  == 754
p before_midnight('12:34') == 686

p after_midnight('24:00')  == 0
p before_midnight('24:00') == 0