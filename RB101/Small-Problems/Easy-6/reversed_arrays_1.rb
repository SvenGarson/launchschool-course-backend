=begin
  input:
    some array
  output:
    the same array object with it's object reversed

  requirements:
    explicit:
      method name: reverse!
      take one array as argument
      mutate array in place -> same array object
      do not use Array#reverse or Array#reverse!

    implicit:
      object reference in the array returned the same as when method entered

  mental model:
    Reverse the objects in the original array passed to the method
    and return the same array passed into the method with the object
    reference reversed.

  test cases:
    inp: [1,2,3,4]
    out: [4,3,2,1]

    where inp.object_id and out.object_id are the same
    and object id's inp[0] and out[3] are the same

  DS and algo:

    create copy of original array with the original values in same order
    iterate the range of the array fomr zero to n-1:
      replace the original aray's reference with the one at the
      opposite side of the copied array
    return the original array

  pseudo:
    cpy = duplicate of original array
    iterate from 0 to array.size - 1 with index 'i':
      replace original array reference at 'i' with
      the one in copy at '-1-i''
    return the original array

  pseudo 2:
    determine center index to iterate to c = array.size / 2
    iterate through range i = [0; c-1]:
      copy references of original into temporary array:
        -> temp = [orig[i], orig[-1-i]]
      then set replace original array ref. with the opposing ones
      inf temporary array:
        -> orig[-1-i], orig[i] = temp
    return the original array


  accum:
    input and output same array object
    method name: reverse!
    don't use Array#* methods
    return original array

=end

def reverse_3!(array)
  center_index = array.size / 2
  for i in (0...center_index)
    i_opp = (-1 - i)
    array[i_opp], array[i] = array[i], array[i_opp]
  end
  array
end

def reverse_2!(array)
  center_index = array.size / 2
  for i in (0...center_index)
    i_opp = (-1 - i)
    tmp = [array[i], array[i_opp]]
    array[i_opp], array[i] = tmp
  end
  array
end

def reverse!(array)
  cpy = array.dup
  index = 0
  while index < array.size
    array[index] = cpy[-1-index]
    index += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4,3,2,1]
p list == [4,3,2,1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ['c', 'd', 'e', 'b', 'a']
p list == ['c', 'd', 'e', 'b', 'a']

list = ['abc']
p reverse!(list) == ['abc']
p list == ['abc']

list = []
p reverse!(list) == []
p list == []

puts '### Approach without array duplicate => in place ###'

list = [1,2,3,4]
result = reverse_2!(list)
p result == [4,3,2,1]
p list == [4,3,2,1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse_2!(list) == ['c', 'd', 'e', 'b', 'a']
p list == ['c', 'd', 'e', 'b', 'a']

list = ['abc']
p reverse_2!(list) == ['abc']
p list == ['abc']

list = []
p reverse_2!(list) == []
p list == []

puts '### Approach without array duplicate and parallel assignment ###'

list = [1,2,3,4]
result = reverse_3!(list)
p result == [4,3,2,1]
p list == [4,3,2,1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse_3!(list) == ['c', 'd', 'e', 'b', 'a']
p list == ['c', 'd', 'e', 'b', 'a']

list = ['abc']
p reverse_3!(list) == ['abc']
p list == ['abc']

list = []
p reverse_3!(list) == []
p list == []