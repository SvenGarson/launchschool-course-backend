=begin

inp:
- 2 array
out:
- new array with all elements from both input arrays
  merged in alternating order

exp:
- method name : interleave
- both arrays:
    - same length
    - non-empty
- return new array
imp:
-? if both arrays empty, return empty array

dsal:
  - res = new empty array
  - iterate  [i] through range from [0; any array length[:
    - res add arr_1 at i
    - res add arr_2 at i
  - return res

  - res = new aray of size left + right
  - for [i] range [0; arr_1.length[:
    - base index = i * 2
    - res[base+0] = arr_1[i]
    - res[base+1] = arr_2[i]
  - return res

=end

def interleave(arr_1, arr_2)
  res = Array.new(arr_1.length+arr_2.length)
  (0...arr_1.length).each do |i|
    i_base = i * 2
    res[i_base], res[i_base+1] = arr_1[i], arr_2[i]
  end
  res
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([], []) == []