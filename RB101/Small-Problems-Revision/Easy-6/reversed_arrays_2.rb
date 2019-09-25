=begin

inp:
- some array
out:
- new array with arg elements reversed

exp:
- cannot use Array#reverse or Array#reverse!
- cannot use method from previous exercise
- do not mutate original array
- empty array returns new empty array

exploration:

arg: [1,2,3,4]
out: [4,3,2,1] -> new object

dsal:

  first approach
    - res = new array of arg.length
    - plot index = 0
    - iterate arg back to front through [o]:
      - res[plot index] = [o]
      - plot index += 1
    - return new array

  second approach using Array#each_with_object:
    - res = new array
    - for each object [o] in arr for [memo]:
      - prepend o to memo
    - return res

=end

def reverse(arr)
  res = Array.new(arr.length)
  cpy_index = 0
  arr.reverse_each do |obj|
    res[cpy_index] = obj
    cpy_index += 1
  end
  res
end

def reverse_2(arr)
  arr.each_with_object(Array.new) do |obj, accum|
    accum.unshift(obj)
  end
end

puts '### Solution using iteration ###'
p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == [] 

list = [1, 3, 2]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]

puts '### Solution using Array#each_with_object ###'
p reverse_2([1,2,3,4]) == [4,3,2,1]
p reverse_2(%w(a b e d c)) == %w(c d e b a)
p reverse_2(['abc']) == ['abc']
p reverse_2([]) == [] 

list = [1, 3, 2]
new_list = reverse_2(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]