=begin
  
  input:
    float that represents angle between 0 and 360

  output:
    string that return angle in degrees, minutes and seconds
    int the format deg°min'sec"

  requirements:
    explicit:
      method called dms with one float parameter
      use ° for degrees
      use ' for minutes
      use " for seconds
      1 degree = 60 minutes
      1 minutes = 60 seconds
      format minutes and seconds 2 wide with leading zero's
      The result for 360 can be wrapped to 0 but also stay 360 based on the
      last test case given

    implicit:
      ? is the input in range [0; 360] exactly?
      ? Need to handle negativ enad values > 360?
      one could convert 360 degrees to zero at before computing the result
      but leave the fractional part intact as to wrap everything >= 360 degrees
      to the correct range.

  mental model:
    Take angle as float in degrees and convert it to degrees, minutes and seconds
    in a method called dms.
    Generate a string in th format deg°min'sec" where the minutes and seconds
    are 2 characters wide and lead by zero's if less than 2 characters wide.

  test cases:

    inp: 30
    out: 30°0'0"

    inp: 76.73
    out: 76°43'48

    degrees, fraction = degrees.divmod(1)
    seconds_total = fraction * SECONDS_PER_DEGREE
    minutes, second = second_total.divmod(SECONDS_PER_MINUTE)

    inp: 360
    out: 0°0'0"

    degrees, fraction = degrees.divmod(1) ==> 360, 0
    seconds_total = fraction * SECONDS_PER_DEGREE ==> 0
    minutes, second = second_total.divmod(SECONDS_PER_MINUTE ==> 

  ds & algo:
    take degrees and convert them into degrees, minutes and seconds
    create string representation in te right format
    return that string

  accum:
    n/a

=end

CHAR_DEGREE = "\xC2\xB0"
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees)
  degrees, fraction = degrees.divmod(1)
  seconds_total = fraction * SECONDS_PER_DEGREE
  minutes, seconds = seconds_total.divmod(SECONDS_PER_MINUTE)
  format("%d%c%02d'%02d\"", degrees, CHAR_DEGREE, minutes, seconds)
end

puts dms(30)        == %(30°00'00")
puts dms(76.73)     == %(76°43'48")
puts dms(254.6)   # == %(254°36'00") close to the desired result
puts dms(93.034773) == %(93°02'05")
puts dms(0)         == %(0°00'00")
puts dms(360)       == %(360°00'00")