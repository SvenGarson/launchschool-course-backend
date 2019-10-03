=begin

>Method: star
inp:
- N = odd integer >= 7
side-effect:
- print 8-pointed star to stdout
out:

exp:
- grid same height than width, i.e N = N
- grid size aleays odd and >= 7

explore:

 n = 7

*  *  *		3 stars | 2 gap between | 0 lead
 * * *		3 stars | 1 gap between | 1 lead
  ***			3 stars | 0 gap between | 2 lead
*******   n stars | 0 gap between | 0 lead
  ***  
 * * *
*  *  *

leading spaces: [0, 1, 2, 0, 2, 1, 0]

	total character per row = n
	lead = n
	stars = 3 (in center stars = 7)
	spacing = (total - stars - (2 x lead)) / 2

	total = 7
	1. spacing = (7 - 3 - (2 * 0)) / 2 = 2
	2. spacing = (7 - 3 - (2 * 1)) / 2 = 1
	3. spacing = (7 - 3 - (2 * 2)) / 2 = 0
	4. spacing = (7 - 7 - (2 * 0)) / 2 = 0

	build string per row the following way:

		lead + star + spacing + star + spacing + star (+ lead)
		lead + star + spacing + star + spacing + star

	generating the lead count:

			n = 7
			ramp up = (0...(n/2)) = (0...(7/2)) = (0...3)
			ramp down = ramp up reversed
			and a 0 in the center

impl:

	> print row for(leading, grid size)
	- spacing = (grid size - 3 - (2 x leading)) / 2
	- row = lead + star + spacing + star + spacing + star
	- puts row

	>impl 1
	- for range (0...(grid_size/2)) -> print row
	- for 0 -> print row
	- for range (0...(grid_size/2)).reverse -> print row

=end

def print_row(leading, grid_size)
	star_spacing = (grid_size - 3 - (2 * leading)) / 2
	stars = ('*'*3).chars
	row = stars.join(' ' * star_spacing).center(grid_size)
	puts row
end

def star(grid_size)
	half = (grid_size / 2).floor
	0.upto(half - 1){ |lead| print_row(lead, grid_size) }
	puts '*' * grid_size
	(half-1).downto(0) { |lead| print_row(lead, grid_size) }
end

7.step(19, 2) do |grid_size|
	puts '### 8-sided star with grid size #{grid_size} ###'
	star(grid_size)
end