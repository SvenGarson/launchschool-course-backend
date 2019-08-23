=begin
  inp:
    3 numbers, int or float
  out:
    symbol :equiliteral or :isosceles or :scalene

  requir.:

    explic:
      - method name: triangle
      - args       : 3 number for lengths of triangle edges, int or float
      - valid triangle is:
          - sum of two shortest edge lengths > longest edge length
          - all edge lengths > 0
      - return symbol:
          - :equiliteral if 3 edges same length
          - :isosceles   if 2 edges same length
          - :scalene     if   edges diff length
          - :invalid     if   edges      invalid
  
  mental model: Determine if the edge lengths are invalid and for that return
  :invalid, if not, continue to determine whether the triangle is equi, iso or
  scalene and return the appropriate symbol.

  exploration: put number into array and remove the doubles which tells us how
  many sides where the same, i.e:
    A) [1,2,3] => [1,2,3] ==> 3 lengths -> scalene -> no same lengths
    B) [1,2,2] => [1,2]   ==> 2 lengths -> iso     ->  2 same lengths
    C) [5,5,5] => [5]     ==> 1 length  -> equi    ->  3 same lengths
  
  ds and algo:

    - incr = edge lengths low -> high
    - sum_shortest = incr first + incr second
    - longest = incr last
    - sum_all = sum_shortest + incr last
    - if sum shortest <= longest or sum all <= 0:
        -> return :invalid
    - remove doubles from the incr array
    - if incr.count == 1 -> return :equi
    - if incr.count == 2 -> return :iso
    - if incr.coutn == 3 -> return :scal

=end

ISO      = :isosceles
EQUI     = :equilateral
SCAL     = :scalene
INVALID  = :invalid

def triangle(a, b, c)

  incr = [a, b, c].sort
  sum_shortest = incr[0] + incr[1]
  longest = incr.last
  sum_all = sum_shortest + longest
  if sum_shortest <= longest || sum_all <= 0
    return INVALID
  end
  
  incr.uniq!
  edges_left = incr.size

  case edges_left
  when 1 then EQUI
  when 2 then ISO
  when 3 then SCAL
  end

end

p triangle(3, 3, 3)   == EQUI
p triangle(3, 3, 1.5) == ISO
p triangle(3, 4, 5)   == SCAL
p triangle(0, 3, 3)   == INVALID
p triangle(3, 1, 1)   == INVALID
