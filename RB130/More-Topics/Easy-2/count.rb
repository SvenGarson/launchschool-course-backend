=begin

inp: optional argument list
out: 
  - return number of times block returns truthy value for each arg

=end

def count(*args)
  count = 0
  args.each do |obj|
    count += 1 if yield(obj)
  end
  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3