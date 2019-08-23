=begin
  
  inp:
    3 triangle lengths (ints only in tests given)
  out:
    symbol :right; :acute; :obtuse or :invalid

  requir.:
    
    explic.:
      - method name: triangle
      - args       : degrees and Integer's
      - valid triangle:
          - sum of angles = 180 degrees
          - all angles > 0
      - def:
        - right : one angle    90 deg
        - acute : all angles < 90 deg     
        - obtuse: one angle  > 90 deg

  ds and algo:

    - if sum angles != 180 or any angle zero -> invalid
    - if one angle  = 90                      -> right
    - if all angles < 90                      -> acute
    - if one angle  > 90                      -> obtuse

=end

def triangle(a, b, c)
  angles = [a, b, c]
  case
  when angles.reduce(:+) != 180 || angles.any? { |a| a == 0}
    :invalid
  when angles.count(90) == 1
    :right
  when angles.all? { |a| a < 90 }
    :acute
  when angles.any? { |a| a > 90}
    :obtuse
  end
end

def triangle_ref(a, b, c)
  angles = [a, b, c]
  case
  when angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |a| a < 90 }
    :acute
  when angles.any? { |a| a > 90}
    :obtuse
  end

end

puts '### First solution ###'
p triangle(60, 70, 50)  == :acute
p triangle(30, 90, 60)  == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90)   == :invalid
p triangle(50, 50, 50)  == :invalid

puts '### Slightly refactored solution ###'
p triangle_ref(60, 70, 50)  == :acute
p triangle_ref(30, 90, 60)  == :right
p triangle_ref(120, 50, 10) == :obtuse
p triangle_ref(0, 90, 90)   == :invalid
p triangle_ref(50, 50, 50)  == :invalid