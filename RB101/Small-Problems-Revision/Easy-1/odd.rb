=begin
  inp:
    1) num => int [-inf; +inf] 
  out:
    - if num odd  -> true
    - if num even -> false

  requir.:
    explic.:
      - method name: is_odd?
      - consider absolute value 
      - num is valid int
      - cannot use #odd? and #even?

=end

def is_odd?(num)
  num.abs % 2 == 1
end

puts is_odd?(2)   == false
puts is_odd?(5)   == true
puts is_odd?(-17) == true
puts is_odd?(-8)  == false
puts is_odd?(0)   == false
puts is_odd?(7)   == true