def sum(num)
  num.to_s.chars.map { |ch| ch.to_i}.reduce(:+)
end

p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45