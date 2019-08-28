=begin
  input:
    some array
  output:
    new array with elements of the original, passed in array, in reverse

  requirements:
    explicit:
      method named: 'reverse'
      returns a new array object
      do not use Array#reverse and Array#reverse!

    implicit:
      new array contains same object references as original

  mental model:
  create and return a new array that contains the reversed list
  of the original values.

  ds and algo:
    - iterate new array from 0 to orig.size - 1 trough 'i':
      - set new[i] to orig[-1-i]
    return new array

=end

def reverse(array)
  size = array.size
  new_array = Array.new(size)
  i = 0
  while i < size do
    i_opp = - 1 - i
    new_array[i] = array[i_opp]
    i += 1
  end
  new_array
end

def reverse_2(array)
  new_array = []
  array.reverse_each { |elem| new_array << elem }
  new_array
end

def reverse_3(array)
  new_array = []
  array.each_with_object(new_array) { |elem, obj| obj.unshift(elem) }
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 3, 2]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]

puts '### Solution with reverse_each ###'
p reverse_2([1,2,3,4]) == [4,3,2,1]
p reverse_2(%w(a b e d c)) == %w(c d e b a)
p reverse_2(['abc']) == ['abc']
p reverse_2([]) == []

list = [1, 3, 2]
new_list = reverse_2(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]

puts '### Solution with each_with_object ###'
p reverse_3([1,2,3,4]) == [4,3,2,1]
p reverse_3(%w(a b e d c)) == %w(c d e b a)
p reverse_3(['abc']) == ['abc']
p reverse_3([]) == []

list = [1, 3, 2]
new_list = reverse_3(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]


