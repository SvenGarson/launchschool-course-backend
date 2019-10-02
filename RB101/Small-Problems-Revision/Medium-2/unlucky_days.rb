=begin

inp:
- year as Int
out:
- number of Friday's with the date 13 in that year

exp:
- year > 1752

explore:

	Each month can have only one friday 13, so:
	Check how many of the 12 months 13th day is a friday
	in the given year

dsal:

	>impl 1	
	- count = 0
	- for [month] in range [1; 12]:
		- date = new Date for [year] [month] [13]
		- count += 1 if date.friday?
	- return count

	>impl 2
	- 

=end

require 'Date'

def friday_13th(year)
	unluckies = 0
	for month in (1..12)
		date = Date.new(year, month, 13)
		unluckies += 1 if date.friday?
	end
	unluckies
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2