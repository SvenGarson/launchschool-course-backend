def average(numbers)
  avg = numbers.reduce(:+) / numbers.size
  avg.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])