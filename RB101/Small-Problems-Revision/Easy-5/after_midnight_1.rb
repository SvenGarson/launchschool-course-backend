=begin
  
  inp: any Integer [-inf, +inf] of minutes before(-)
       of after(+) midnight.
  out: string of time in 24 hour format hh:mm

  exp:
    - cannot use Date and Time class
    - disregard other complications
    - negative => before midnight
    - positive => after  midnight

  exploration:

    - wrapping 24 hours has no effect
    
    - minutes_wrapped = arg % MINUTES_PER_DAY
    - clock_hours   = minutes_wrapped / 60
    - clock_minutes = minutes_wrapped % 60
    - string => 'clock_hours:clock:minutes'
    
=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(minutes)
  minutes = minutes % MINUTES_PER_DAY
  clock_hours, clock_minutes = minutes.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d", clock_hours, clock_minutes)
end

p time_of_day(0)     == '00:00'
p time_of_day(-3)    == '23:57'
p time_of_day(35)    == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000)  == '02:00'
p time_of_day(800)   == '13:20'
p time_of_day(-4231) == '01:29'