=begin

  inp:
    - degrees as float
  out:
    - string that repr. "deg°min'sec''"
   exp:
    - use "\xC2\cB0" as ° code
    - one degree = 60 minutes
    - one minute = 60 seconds
    - minutes and seconds padded with zero's if
      number not 2 digits, the degree part does
      not get leading zero's based on the two last
      tests given
    - 360 degrees wraps to zero since 0 and 360
      degrees are the same so the complete range
      is (0..359)
  
  exploration:
    
    inp:
          - 76.73 degrees
    out:
          - whole = 76
          - frac  = .73
          - degrees = whole = 76
          - total seconds = frac * minutes per degree * sec per min
                          = 0.73 * 60 * 60 = 2628
          - minutes = total seconds / seconds per min
                    = 2628 / 60 = 43
          - seconds = total seconds % seconds per min
                    = 2628 % 60 = 48

  ds and algo:

    - whole =  whole part
    - frac  = fractional part
    - degrees = whole % 360
    - total_frac_sec = frac * min_per_degree * sec_per_min
    - minutes = total_frac_sec / sec_per_min
    - seconds = total_frac_sec % sec_per_min
    - return string format

  further exploration:

    what if input is outside the range [0; 360], i.e
    when the input is less than 0 or larger than 360?

    tests given:

    inp: 400  out:  40/00/00 => 400 % 360 = 40 
    inp: -40  out: 320/00/00 => 360 - arg.abs   = 360 - 40  = 320
    inp: -420 out: 300/00/00 => 360 - arg.abs % 360
                             => 360 - (420 % 360)
                             => 360 - 60 = 300

    so  if arg > 360
      -> degrees = arg % 360
    and if arg < 0
      -> degrees = 360 - (arg.abs % 360)

=end

SYM_DEGR = "\xC2\xB0"

MINS_PER_DEGREE = 60
SECS_PER_MIN = 60
SECS_PER_DEGREE = MINS_PER_DEGREE * SECS_PER_MIN

def dms(degrees)
  # wrap the argument correctly to account
  # for further exploration
  if degrees > 360
    degrees = (degrees % 360)
  elsif degrees < 0
    degrees = 360 - (degrees.abs % 360)
  end
  
  # compute the string asked by the initial problem
  whole = degrees.floor
  frac  = degrees.modulo(1.0)
  degrees = whole
  total_frac_seconds = frac * SECS_PER_DEGREE
  minutes, seconds = total_frac_seconds.divmod(SECS_PER_MIN)
  format("%d%c%02d'%02d\"", degrees, SYM_DEGR, minutes, seconds)
end

puts '### Solution to problem ###'
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") || dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts '### Further exploration for argument outside range [0; 360] ###'
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")