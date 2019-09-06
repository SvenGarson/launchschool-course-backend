=begin
  inp:
    - array of Int's
  out:
    - array of running totals

  exp:
    - method name: running_total
    - empty arg -> empty return array
    - returned array same size as arg  
  imp:
    -? 'an Array' as in new object

  - accum = 0
  - create new array
  - for [i] in range (0..array.size-1):
    - accum += current number
    - add accum to new array
  - return new array

  rubystyle:
  - accum = 0
  - map arg array to new array:
    - accum += current number
    - return accum to replace
  - return that new array

  further exploration:
  
  using inject

=end

def running_total(arr)
  accum = 0
  arr.map do |num|
    accum += num
  end
end

def running_total2(arr)
  arr.inject(:+)
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([])  == []