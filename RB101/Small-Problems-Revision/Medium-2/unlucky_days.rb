=begin
  inp: 
    year > 1752
  out:
    count of fridays with date 13. in given year

  exploration: 12 months a year and one 13th per month means there
  are 12 days to check. So counting the times where the 13. in a
  given month is a friday gets us the desired result.

  ds and algo:

    - counter = 0
    - for every month from 1 to 12:
      - if day at 13th a friday?
        -> incremen counter
    - return counter
  
=end

require 'date'

def friday_13th(year)
  unlucky_days = 0
  1.upto(12) do |month|
    date_13 = Date.new(year, month, 13)
    unlucky_days += 1 if date_13.friday?
  end
  unlucky_days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2