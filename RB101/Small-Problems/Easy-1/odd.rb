def is_odd?(integer)
  absolute = (integer < 0) ? -integer : integer
  absolute % 2 != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)