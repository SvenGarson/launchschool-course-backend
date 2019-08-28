def multiply(a, b)
  a * b
end

def square(number)
  multiply(number, number)
end

def square_n(base, expo)
  accum = base
  (expo-1).times { accum *= base }
  accum
end

puts square(5) == 25
puts square(-8) == 64

puts square_n(2, 4) == 16
puts square_n(3, 4) == 81