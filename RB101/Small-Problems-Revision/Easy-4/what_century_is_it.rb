=begin
  
  inp:
    - year as Integer
  out:
    - string of format century+suffix(st, nd, rd, th)

  exp:
    - methods name: century
    - century begins with each year + 1 like:
      -1; 101; 2001 and greater
  
  imp:
    -? input always int

  mental model:

  Convert Year as integer to a string that denotes the
  century with the appropriate suffix.

  exploration:

    2000 / 100 = 20.0  => 20    => round up ==> 20
    2001 / 100 = 20.01 => 20.01 => round up ==> 21

    century = (year/100) rounded up to next integer

    number suffix:

    The number suffix if based on the ones place of a
    given number. The exception are numbers that end 
    between 10 and 20 inclusive for which:
    0th -> 10th -> 20th
    1st -> 11th -> 21st
    2nd -> 12th -> 22nd
    3rd -> 13th -> 23rd
    4th -> 14th -> 24th

    Which means that number from 11 to 19 end with 'th'
    regardless their ones place digit, and the rest goes
    with the rule:
    xx0 th
    xx1 st
    xx2 nd
    xx3 rd
    xx4 th
    xx5 th
    ...
    xx9 th

    So first determine for exception:
      - last 2 numbers, tens and ones = number % 100

      2012 % 100 = 12
      212 % 100 = 12
      12 % 10 = 12
      2 % 10 = 2

      - if that number >10 and < 20 --> suffix = 'th'
      - else use ones place to generate suffix

    - if exception -> 'th'
    - else:
      - ones place = last_two % 10
      - 1 -> st; 2 -> nd etc

    ds and algo:
    
      - century = (year / 100.0) roun to next integer
      - get suffix 
      - return century + suffix as string

=end

def suffix(number)
  tens_ones = number % 100
  ones = tens_ones % 10
  if (11..19).cover?(tens_ones) || !(1..3).cover?(ones)
    'th'
  else
    case ones
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
    end
  end
end

def century(year)
  century = (year / 100.0).ceil
  century.to_s + suffix(century)
end

p century(2000)  == '20th'
p century(2001)  == '21st'
p century(1965)  == '20th'
p century(256)   == '3rd'
p century(5)     == '1st'
p century(10103) == '102nd'
p century(1052)  == '11th'
p century(1127)  == '12th'
p century(11201) == '113th'