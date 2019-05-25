
=begin
(1..99).each do |i|
  puts "#{i}" if i.odd?
end
=end

=begin
1.upto(99) { |i| puts "#{i}" if i.odd?}
=end

(1..99).select(&:odd?).each do |i|
  puts i
end
