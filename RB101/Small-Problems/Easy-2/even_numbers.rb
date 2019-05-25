=begin
(1..99).select(&:even?).each do |i|
  puts i
end
=end

num = 2
while num < 100
  puts num
  num += 2
end