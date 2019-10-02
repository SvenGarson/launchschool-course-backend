=begin

inp:
- 3 angles as Integer
out:
- return symbol :right; :acute; :obtuse or :invalid
	based on triangle angle configuration

-exp:
- types of triangles:
	- right : one angle is 90
	- acute : all angles less than 90
	- obtuse: one angle > 90
- valid triangle:
	- sum of angles exactly 180 degrees
	AND
	- no angle can be zero 
- assume Integer for exact angles
- angles expressed in degrees

dsal:

	>impl 1
	- if sum of angles not 180 -> invalid
	- if one angle 90 				 -> right
	- if all angles < 90 			 -> acute
	- if one angle > 90 			 -> obtuse

=end

def triangle(a, b, c)
	angles = [a, b, c]
	case
	when angles.sum != 180 || angles.include?(0)
		:invalid
	when angles.one? { |angle| angle == 90 }
		:right
	when angles.all? { |angle| angle < 90 }
		:acute
	when angles.one? { |angle| angle > 90 }
		:obtuse
	end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid