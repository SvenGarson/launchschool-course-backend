=begin

  Rew:
  - Write method named reverse!
  - takes array as param
  - reverse elements in place -> mutate param
  - return modified param object
  - can't use Array#reverse and Array#reverse!

  exp:
  - method name reverse!
  - arg = some array
  - mutate param array
  - return param reference
  - cannot use Array#reverse or #reverse!
  - swap operations same for even and odd sized array
    -> (int)(array.size / 2)

  exploration:

    - pop of value
    - indexed iteration
    - iterate in reverse order
    - in place ordering without duplicate

    inp: [1,2,3,4]
    out: [4,3,2,1]
          ^ ^ ^ ^
    index 0 1 2 3        

    To reverse this array all we need to do is:
      - reverse values at index 0 and 3
      - reverse values at index 1 and 2

    1. [1,2,3,4]
    2. [4,2,3,1]
    3. [4,3,2,1]

    - if array size [n] even, then (int)(n/2) swaps occur
      -> n = 4 => swaps = 4/2 = 2
    - if array size [n] odd , then (int)(n/2) swaps occur
      -> n = 5 => swaps = 5/2 = (int)2.5 = 2
    
    Indices that swap values for arary of
    size 4 and swaps 2:

    L | R
    -----
    0 |-1 ==> R = -(L+1) = -(0+1) = -1
    1 |-2 ==> R = -(L+1) = -(1+1) = -2

  observation:
    - off sized array does not need to move center object
    - same swap operation occur for even and odd sized array
  
  dsal:

    - swaps = array objects / 2
    - for index [i] in range [0; swap[ :
      - index_right = -(i+1)
      - swap both values
    - return argument

=end

def reverse!(arr)
  swaps = (arr.length / 2).floor
  for i in (0...swaps)
    i_right = -(i+1)
    arr[i], arr[i_right] = arr[i_right], arr[i]
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4,3,2,1]
p list == [4,3,2,1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == %w(c d e b a)
p list == %w(c d e b a)

list = ['abc']
p reverse!(list) == ['abc']
p list == ['abc']

list = []
p reverse!(list) == []
p list == []