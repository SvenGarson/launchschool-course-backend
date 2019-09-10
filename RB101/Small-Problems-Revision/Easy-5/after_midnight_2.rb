=begin

  # method 1: after midnight #
  inp:
    - string of 24 hour format 'hh:mm'
  out:
    - minutes arg is before midnight as Integer

  # method 2: after midnight #
  inp:
    - string of 24 hour format 'hh:mm'
  out:
    - minutes arg is after midnight as Integer

  exp:
    - method names: after_midnight / before_midnight
    - arg is string as 24 hour time format 'hh:mm'
      such as '23:50'
    - range of return value [0, 1439]
    - cannot use Ruby Time and Date methods
    - 24:00 is not a valid 24 hour time
    - disregard other irregularities
  
  imp:
    -! 24:00 is actually 00:00
    -? input always valid 24 hour time other than the 24:00
      thing

  ds and algo:

    after midnight
    --------------

    - if hour is 24 set to zero, actually any multiple of 24
    - hour is equals to hours
    - minutes to minutes

    before midnight
    ---------------

    - before and after midnight of same time sum to 1440 minutes
    - before midnight is 1440 - after midnight

=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  h, m = time.split(':').map { |str| str.to_i}
  h %= HOURS_PER_DAY
  h * MINUTES_PER_HOUR + m
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

p after_midnight('00:00')  == 0
p before_midnight('00:00') == 0
p after_midnight('12:34')  == 754
p before_midnight('12:34') == 686
p after_midnight('24:00')  == 0
p before_midnight('24:00') == 0