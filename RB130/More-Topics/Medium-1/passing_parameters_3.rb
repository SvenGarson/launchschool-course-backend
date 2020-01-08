items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts "\n1st exercise"
puts "------------"
gather(items) do |*first_3, last|
  puts first_3.join(', ') 
  puts items.last
end

puts "\n2nd exercise"
puts "------------"
gather(items) do |first, *center, last|
  puts first
  puts center.join(', ')
  puts last
end

puts "\n3rd exercise"
puts "------------"
gather(items) do |first, *rest|
  puts first
  puts rest.join(', ')
end

puts "\n4th exercise"
puts "------------"
gather(items) do | a, b, c, d|
  puts [[a, b, c].join(', '), d].join(', and ')
end

puts ''