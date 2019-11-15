=begin

Requirements for class 'FixedArray'
-----------------------------------

  - constructor(initial_capacity)
  - indexed element reference
  - indexed element assignment
  - to_a -> just the array
  - to_s -> format '[a, b, c]' with types shown

=end

class FixedArray

  def initialize(capacity)  
    self.array = Array.new(capacity)
  end

  def [](index)
    array.fetch(index)
  end

  def []=(index, entry)
    self[index]
    array[index] = entry
  end

  def to_a
    array.dup
  end

  def to_s
    array.inspect
  end

  private

  attr_accessor :array

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end