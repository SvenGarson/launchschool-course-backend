=begin

inp:
- 3 floats => lengths of triangle sides
out:
- symbols equi/isos/scal/invalid

exp:
- triangle types:
	- equilateral: 3 sides equal
	- isosceles  : 2 sided equal
	- scalene    : 3 sides different
- valid triangle:
	- sum 2 shortest sides > longest side
	- all sides must have length > 0

expl:

	- if triangle invalid -> return invalid
	- else:
		- idem = how many sides are same length

	finding the type of triangle efficiently:

		inp: [3, 3, 3]
		out: equilateral

			[3, 3, 3].uniq => [3]
			count = 1

		inp: [3, 3, 2]
		out: isosceles

			[3, 3, 2].uniq => [3, 2]
			count = 2

		inp: [3, 2, 1]	
		out: scalene
		
			[3, 2, 1].uniq => [3, 2, 1]
			count = 3

rules for type of triangle:
	count = sides_ar.uniq
	count == 1: type equilateral
	count == 2: type isosceles
	count == 3: type scalene


dsal:

	>impl 1
	- asc = [a, b, c].sort
	- if asc[0, 2].sum > asc.last && asc.sum > 0
		- uniq_sides = asc.uniq.length
		RULES
	- else
		-> return invalid

=end

def triangle(a, b, c)
	asc = [a, b, c].sort
	# guard against invalid triangles
	if asc[0, 2].sum <= asc.last || asc.include?(0)
		return :invalid
	end
	
	# return type of triangle
	uniq_sides = asc.uniq
	case uniq_sides.length
	when 1 then :equilateral
	when 2 then :isosceles
	when 3 then :scalene
	end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid